project "DirectXTK12"
    kind "StaticLib"
    language "C++"
    staticruntime "on"

    targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "pch.h"
    pchsource "Src/pch.cpp"

    includedirs
    {
        "inc/",
        "src/",
        "src/shaders/compiled"
    }

    files
    {
        "**.h",
        "**.cpp"
    }

    filter "system:windows"
        cppdialect "C++20"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"

    removefiles("Src/pch.h")
    removefiles("Src/pch.cpp")
    removefiles("src/XboxDDSTextureLoader.cpp")
    removefiles("Inc/XboxDDSTextureLoader.h")
