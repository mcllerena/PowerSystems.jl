Pkg.add("Suppressor")

files = readdir(joinpath(Pkg.dir(),"PowerSystems/data/matpower"))
file_ext = r".*?\.(\w+)"

if length(files) == 0
    error("No test files in the folder")
end

for f in files
    try
        ext = match(file_ext, f)
        print("Parsing $f ...\n")
        @test_nowarn ParseStandardFiles(joinpath(Pkg.dir(),"PowerSystems/data/matpower",f))
        println("Successfully parsed $f")
    catch
        warn("Error while parsing $f")
        catch_stacktrace()
    end
end

files = readdir(joinpath(Pkg.dir(),"PowerSystems/data/psse_raw"))
file_ext = r".*?\.(\w+)"

if length(files) == 0
    error("No test files in the folder")
end

for f in files
    try
        ext = match(file_ext, f)
        print("Parsing $f ...\n")
        @test_nowarn ParseStandardFiles(joinpath(Pkg.dir(),"PowerSystems/data/psse_raw",f))
        println("Successfully parsed $f")
    catch
        warn("Error while parsing $f")
        catch_stacktrace()
    end
end

true