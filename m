Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOUT43TAKGQEFLZ5PUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DA1B9A3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 17:14:03 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id c14sf8553278wrv.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 08:14:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557760442; cv=pass;
        d=google.com; s=arc-20160816;
        b=tAURLK4a9nkV+yBIj+J8Ur+V4GCGct62MaMeekRCidvjROwzTP571jR4DHR2jA4o0A
         FZ8CjTaffvoaaRAFjnlVCmS54/BEal2WiIFHKwksPnQUtolg6A5QuitfhFGzzy2Aa4Ky
         WKRsYOWxHYnQgMPrN8SJC9Ls1ywbwAWA26sssmIY/EX8LAA7BBIk7+XflPyDlUJZ55AF
         DZQVV9bqQXAG98e8Vj8aQFJF4Sf3pk3yBcNCj2JrFZrdR8FCNJPE+KbE4zpk6uXLiycM
         VbG46xBBav77VtcJF/2oFFuyQ+xTiY3beYY8sZt75NKiulv8O0SRQOtUKLbtMRns1/cu
         Oh7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=PQF9cW8tOE8iclQD6qor6wGuoHojxiC2HIuYINZWngo=;
        b=SaUXkTVrK9OfaXESVz74I19QIKzE0STOPX/z0xC+VlYQrMSjj7XmX9tb3iIcELWGwe
         /w6zucyqyQ12Wxv7MeLWlDxCFaimfJz3obkTnWUgdHzqSMKep6srmFfKWNRf5r7wxNdm
         AqdgaYcdA4JyaqJbP4PtvV40tqQ5VB1gszcAizk7/PIUYO6POOE+9nMj++ti5S2Z65jF
         0FoT1qL0z6ZKu9CkOX91Kl2X4RAT9DmGxjGl3XcjejdP4JUJ2Ww03E7rfi5THuPPUf/A
         9OLwmFFkYEf7O7ACUBBHTZM8Q4bEP1JSzTdV9qjQx4GuEzzlOfzmoHGc/h2/aE7gH8Jq
         EucA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PQF9cW8tOE8iclQD6qor6wGuoHojxiC2HIuYINZWngo=;
        b=NM82o849VGZnqEGRtZF+b2OhdzQ5faqmwbzXaLAIhvt4+/577HmJFpPaPxHBX6J9YA
         XkLtOxvOQBMYMnjrwu3VXA8+3+3713hWpHRIFfEDG5f86tfpr5so063kmVNdyW5jET4U
         3/pJsudQ4/4kV4lNjm+UPsWQJPaLGlcjbHkpMzdBeS+lSwmTEf0Z+5iv7vo9Nab0f5jT
         IezZzoKqAuG6/rKpsE8ahwU8foboU0G677KMARxm7vc84qZ8qhXpVt0qvPc21fUdUqoR
         CLYok83jNN+HYcZNnL53vA9SoWxX/eXV+sVB75euPCKqCcjiNZhtSNG1N//PJFuNo86r
         MIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PQF9cW8tOE8iclQD6qor6wGuoHojxiC2HIuYINZWngo=;
        b=KjvA159TLUPAybYWC5Q+t4wWN8uAh5fCAb9gN7kXFnJQnzwsZKJnXg88WBi/ImRA/6
         sUTehaRH4m5seaXNxYAHe6BcAuIBWPKf5oyu4bqAJwrrbgtmA69+Nf9cnQCJ/End5zmt
         AYFygFM6eMpkRceb0pwI4KH5hr+Yq0AF+BkdAuLSItQZXJmn8ntTcnShVQk0Sy9qWzD0
         rPldkz4mLmmxJVbyiVPHJ2ERAdP+ykxA24yJzSRfZf8abJjmEckUbVwUtxX9rCrrz0ix
         DCeB0hVFsRuU1dPUT/sZdukGF87L9iJl7X+FYT1o9mruvj1mhojPiN+B79LdtBDl+yu/
         knNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUuJpMtvGFITKLyusnc/moMU8BHCrxHQRsnlK8aZ+ytTuGLzBY+
	NQ9na/33nqTXD3jTXMTcmrU=
X-Google-Smtp-Source: APXvYqxq48gVzJ3a2/TC0hMY32w/0Cqa8L4NomtVR6GqlYHJYhkLtm1EpN9XIGfLyxpoaZBooWPfMg==
X-Received: by 2002:a1c:ba87:: with SMTP id k129mr3988698wmf.132.1557760442723;
        Mon, 13 May 2019 08:14:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8184:: with SMTP id 4ls3269179wra.5.gmail; Mon, 13 May
 2019 08:14:02 -0700 (PDT)
X-Received: by 2002:adf:c601:: with SMTP id n1mr13388065wrg.49.1557760442058;
        Mon, 13 May 2019 08:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557760442; cv=none;
        d=google.com; s=arc-20160816;
        b=lS+YTYoixSxfO71pcUkr7tV3vPxo2v/jIEsQ3VFFbUc94LwHbIpGUQ7RxRceb8NOE1
         NStO1WCVaE2Ty+pqBTT1qTd8c9o9ESundDykNPzrL1a9Qw4Ve2NinDTd2dU+gdkceHRq
         QmFZsqjVJFZEaXr2Q84QDTzEMcD60unxYPpOpkRrVnVfAUKb9RCeRzzlapvzxEqyJFB9
         6rsMz6FLBioqtZML8pTvNEJSohD1k5bsUxwAnEXw8/iDN4nwINBWEPgM/3dqrbtyxpGn
         Il1wadA51sh1G8sKsbORvzOWKPit21iWdQh1bl10QpyNjP4Muh6/FYgGH+Iv4xXFFzUZ
         ayyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=UUV1KKQuqU63WCyedxr6/FHlbgsQZESSuk8zww+H0pc=;
        b=OvHhJKwLyFnAMQ1LdPquQs1bPKFKPxfNYlRIrJZ2JlCnj08kthODzvbQ5oDpejIVLd
         NRr33IGNshtF7iTG2sX09baf/foJ75gvjCyVP/KFP++6Hw852vhzC+UTJMhwzq/oxG6t
         8HlvGF9WmSbSwOdm5Km6NDKeGarIvrYPeZaw4QISenMMj4x/Fxs19YgKlHsXcCtjEEdH
         Kh4QhjQtQKpKd6nxI/CV89LSWEMjM9e5rfbc9bo8dHiuawphT0P4Uwd8y39tpRVd0v1e
         5dmGrB8NFu3WjyKObKvpAFVjz7wZjzQ9oIlyeF2JV/MMDpjQ5i7Bo2HzHVyWnBkExXxP
         OnsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d14si3041441wrj.3.2019.05.13.08.14.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 08:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x4DFE1AB027900
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 May 2019 17:14:01 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x4DFE1ts010722;
	Mon, 13 May 2019 17:14:01 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
 <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
 <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
 <8667152c-c459-997e-42d7-0f908418be0e@web.de>
 <e48cdd07-eb0b-47e6-bcbe-9d281819a3f7@googlegroups.com>
 <8189ed45-40e0-46d7-ae43-8139953068d0@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <13823dbb-3cdb-03f0-f642-c28edf7fa6e2@siemens.com>
Date: Mon, 13 May 2019 17:13:58 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <8189ed45-40e0-46d7-ae43-8139953068d0@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On 13.05.19 12:54, Hakk=C4=B1 Kurumahmut wrote:
> 13 May=C4=B1s 2019 Pazartesi 10:40:24 UTC+3 tarihinde jeanne....@gmail.co=
m yazd=C4=B1:
>> Le dimanche 12 mai 2019 09:51:04 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
>>> On 10.05.19 15:11, jeanne***.com wrote:
>>>> Hello everyone,
>>>>
>>>> I'm still trying to get my rootCell running. I have for the moment con=
nected a serial port in order to have the logs in full (in ssh the communic=
ation was down before I could have the logs). After solving some minor erro=
rs (such as Invalid MMIO/RAM read or IO-port) I find myself with an error t=
hat I can't explain:
>>>>
>>>>
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 38000000000 Type 0
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 39000000000 Type 0
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 3b000000000 Type 0
>>>>
>>>>
>>>> Is the new sysfs-parser.py the cause of my trouble or is there anythin=
g I missed in the configuration ?
>>>
>>> Could be. 0x22 means that the device is not present in the interrupt re=
mapping
>>> table of IOMMU that is responsible for that device. Try changing the .i=
ommu
>>> number for that device from 0 to 1 or the other way around. Or is there=
 no entry
>>> for 03:00.0 at all?
>>>
>>> Jan
>>
>> Hello everyone,
>>
>> You can find in attachment my new jailhouse-config-collect. It's actuall=
y when y try to enable my root-cell that I have this error so my root-cell =
is not running and I can't do the "jailhouse cell list".
>>
>> As Jan said I tried to change the .iommu from 1 to 0 for the PCI 03:00.0=
 but that doesn't change the error ...
>>
>> best regards,
>=20
> Actually, I done double check for patch. It is parsing everything satisfa=
ctorily. Also, I parsed DMAR manually. System has two DRHD structure for DM=
AR0 (20:dev.fn subsystems) and DMAR1 (DRHD.flags set INCLUDE_PCI_ALL for th=
e others) Thus, 3:0.0 pci device is assigned to DMAR-1 (iommu-1)
>=20
>=20
> I also attached new patched script file for suitable new next branch. I a=
m planning to release the patch at new mail and subject (git format-patch).
>=20
>=20
> @Jan
>=20
> I have a question about the patch. assign_iommu_info and append_comment_i=
nfo new methods is running for "PCI Express Root Port" or "PCI bridge" prim=
ary and secondary bus,dev,fn.
>=20
> I'm not sure it should work for the primary bus,dev,fn. It doesn't affect=
 the result. But I think it shouldn't work.
>=20
> Do you have any idea?
>=20

Not yet. I need to read into the details again, likely over the next days, =
and=20
then I'll come back.

Jan

>=20
> Example Device Scope:  (00:1c.7 PCI bridge)
>=20
> 01 0A 00 00 00 00 1C 07 00 00
> 01 0A 00 00 00 00 1C 07 00 02
> 01 0A 00 00 00 00 1C 07 00 04
>=20
> It is running order
>=20
> 1.) 00:1C.07
> 2.) sec-bus:00.00
> 3.) 00:1C.07
> 4.) sec-bus:00.02
> 5.) 00:1C.07
> 6.) sec-bus:00.04
>=20
> May be it is run for only secondary buses.
>=20
> 1.) sec-bus:00.00
> 2.) sec-bus:00.02
> 3.) sec-bus:00.04
>=20
>=20
>=20
>=20
>=20
> 000000h   44 4D 41 52 44 04 00 00   DMARD...	length:00000444
> 000008h   01 69 48 50 20 20 20 20   .iHP
> 000010h   50 72 6F 4C 69 61 6E 74   ProLiant
> 000018h   01 00 00 00 D2 04 00 00   ....=C3=92...
> 000020h   2E 16 00 00 2D 03 00 00   ....-...
> 000028h   00 00 00 00 00 00 00 00   ........
>=20
> 000030h   00 00 B0 00 00 00 00 00   ..=C2=B0.....	structType: 0000 (DRHD)=
, structLength: 00B0 flags: 00
> 000038h   00 E0 EF FB 00 00 00 00   .=C3=A0=C3=AF=C3=BB....	base: FBEFE00=
0	(dmar0)
>=20
>=20
>=20
> 000040h   02 08 00 00 00 20 00 00   ..... ..	PCI Sub-hierarchy
> 000048h   02 08 00 00 00 20 01 00   ..... ..	PCI Sub-hierarchy
> 000050h   02 08 00 00 00 20 01 01   ..... ..	PCI Sub-hierarchy
> 000058h   02 08 00 00 00 20 02 00   ..... ..	PCI Sub-hierarchy
> 000060h   02 08 00 00 00 20 02 01   ..... ..	PCI Sub-hierarchy
> 000068h   02 08 00 00 00 20 02 02   ..... ..	PCI Sub-hierarchy
> 000070h   02 08 00 00 00 20 02 03   ..... ..	PCI Sub-hierarchy
> 000078h   02 08 00 00 00 20 03 00   ..... ..	PCI Sub-hierarchy
> 000080h   02 08 00 00 00 20 03 01   ..... ..	PCI Sub-hierarchy
> 000088h   02 08 00 00 00 20 03 02   ..... ..	PCI Sub-hierarchy
> 000090h   02 08 00 00 00 20 03 03   ..... ..	PCI Sub-hierarchy
> 000098h   03 08 00 00 0A 20 05 04   ..... ..	IOAPIC
> 0000A0h   01 08 00 00 00 20 04 00   ..... ..	PCI Endpoint Device
> 0000A8h   01 08 00 00 00 20 04 01   ..... ..	PCI Endpoint Device
> 0000B0h   01 08 00 00 00 20 04 02   ..... ..	PCI Endpoint Device
> 0000B8h   01 08 00 00 00 20 04 03   ..... ..	PCI Endpoint Device
> 0000C0h   01 08 00 00 00 20 04 04   ..... ..	PCI Endpoint Device
> 0000C8h   01 08 00 00 00 20 04 05   ..... ..	PCI Endpoint Device
> 0000D0h   01 08 00 00 00 20 04 06   ..... ..	PCI Endpoint Device
> 0000D8h   01 08 00 00 00 20 04 07   ..... ..	PCI Endpoint Device
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 0000E0h   00 00 28 00 01 00 00 00   ..(.....	structType: 0000 (DRHD), str=
uctLength: 0028 flags: 01
> 0000E8h   00 E0 FF F4 00 00 00 00   .=C3=A0=C3=BF=C3=B4....	base: F4FFE00=
0 (dmar1)
>=20
> 0000F0h   03 08 00 00 08 00 1E 01   ........	IOAPIC
> 0000F8h   03 08 00 00 00 00 05 04   ........	IOAPIC
> 000100h   04 08 00 00 00 00 1F 00   ........	MSI_CAPABLE_HPET
>=20
>=20
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/13823dbb-3cdb-03f0-f642-c28edf7fa6e2%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
