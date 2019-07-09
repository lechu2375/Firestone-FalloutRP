Firestone.speakers = {}
speakers = Firestone.speakers
function speakers.getAll()
    local speakers = {}
    for k,v in pairs(ents.GetAll()) do
        if v:IsValid() and (v:GetClass()=="radio_receiver") then
            speakers[#speakers+1] = v
        end
    end
    return speakers
end

function speakers.TurnOff() 
    for k,v in pairs(speakers.getAll()) do
        timer.Simple(math.random(1, 3), function ()
            v:EmitSound("ambient/energy/newspark0"..math.random(1,9)..".wav")
        end)
        v.dt.On = false
    end
end

function speakers.TurnOn() 
    for k,v in pairs(speakers.getAll()) do
        timer.Simple(math.random(1, 3), function ()
            v:EmitSound("optinvfallout/obj_switch_button_b_pass.wav")
        end)
        v.dt.On = true
    end
end