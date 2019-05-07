Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB35TY3TAKGQEYCQVGXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BD165F7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 16:45:03 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id g10sf2183326lfb.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 07:45:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557240303; cv=pass;
        d=google.com; s=arc-20160816;
        b=HSh10zByiRCTti47GxCNuWBg1U1LaNSDj8tsA+eq62KuBxS0KPWSg4oHRK+nK3BDD2
         usS7gFX+v3l6n3KKrnFMc4npf1mNC+lB0MIkbevGlIoUAjRZHokfzZ1mSXfCEkAq0LCB
         pvltgpwZWapL6qRk5oXq1kdwOFy70abmAgbcYTn4KGgeHN9Xzkx52d8AQddY7r6Rub9r
         WGoCgYF7OosSUJOZvfWh7E0EG2/rVdk9unlI4AOSy6p+vq1aQxwLvm+vVDKDWlti3oU2
         3LcKzlVfIYAxQRJIEjLUkXZRNUlaxk+0exN1E+rUc3R5Dtgz3/1MZl8hTxrsIKdW5qTP
         Nspw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=zc5OoT7Dpb8O6NSoq5G/0jW0dfpUl8FWf/gaJ+9an9w=;
        b=w7XMORxS6Fn1fErysvInMBks2E1tixCQhmsPsT6e2qddp6JRpXL5rOj52V3vg6XuPX
         LWpRslWfL/e9q56SECTi/dgd382Wmi0qS761PWuSNPO3jj+Y1XVOc/ipoctmot1mHEdA
         SlUdh0DNnRh8uH2k/PiwwRUO5+X06L045oJCBMX+ioCwbq04Iy3bbJOh9zLsY+DbEuO0
         blmZrl1TPecmeUDCRcW5306R9cRYkseX9vv0Iu7ttQSk6ExxlXMIMhbZA60W9LrQdIuO
         8yrlrkJcQh+k3P/5ChASYRNl2Vze/UsSPp27dgpo4OnnSMQFZ6tIcpvbgTSzgthEbu5W
         z9XQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zc5OoT7Dpb8O6NSoq5G/0jW0dfpUl8FWf/gaJ+9an9w=;
        b=VrTZoBQ5j0YdJHh92invtMjO2XND1de+HdigyMFAjLwTvbIVS7bMUfkzbRyLs3K8bs
         3KSithHxm5NxJFjZGOxH/Ulc4xYQxZlQABuVp8w6W7u3qjxIn0anvsoqRPpfIqttoleq
         TDrPjpcXqxrkrDyCisqciDrmwnlJ9MeMR6QdBW60EI9HsO2RbjNBN2wgH6D098Pov8Qk
         n2u+xp6//VugLL3tjz4LvjRsknN0oH5qWeNM1zDe4IRXTgqDk2sUJnepN5xV/2wFUMYe
         Ejr5ulf+OaNGHLNlkVwuiqxdSUIUwwYOBzJaMQqy1sIHgXK9syU+nAOhiQyQV92mK4JI
         +zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zc5OoT7Dpb8O6NSoq5G/0jW0dfpUl8FWf/gaJ+9an9w=;
        b=ra3Dj9j17j+PfT5FCMFqGI+H6MPELIEhEbW5Dd3hXN+Pz1Zp3C0MsL8AvArfqPaVDS
         NSxEBdNse5K51rOF/q8Qsdw7pAtDGfRC/TGLe/HTNLLDfvT6L4/Bw8PSQGHHtrvc6SxT
         eX05o55KqOAZKtMkLGcrXrtAt7XpU6xKaA4ER3v9EzMHdRvPNF+/ELTRhQ1wtHkSb1/g
         EJpmrkOnJUi4/bEbqQdAm/LZSoieptHRTWztwwsmDxwM3DV0gMRCIZZiysc+s0hsk4+I
         chHFMrDZIXWcM2gRhk3CsmOQSlzdSm64Jy8Zr6AwUh01ZYtH9nA1m83ZiJMmWrpq/Nid
         VQqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUh5+DwCzjowmZ2UiDqbjmkKqcVKrEBQl+ZxYQYpB4CWNyZrV1b
	F29+2Zf1WVR7sBWzQ7CONqE=
X-Google-Smtp-Source: APXvYqyJMT0tTfhIwS5mKLmKi7/6KrbKppSt8gz1c6Wapy379IfhzNbHaLkOSy7X+etV/YnigysOUg==
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr17469793lji.28.1557240303475;
        Tue, 07 May 2019 07:45:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls1442638lfm.1.gmail; Tue, 07 May
 2019 07:45:02 -0700 (PDT)
X-Received: by 2002:ac2:5307:: with SMTP id c7mr16716988lfh.58.1557240302891;
        Tue, 07 May 2019 07:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557240302; cv=none;
        d=google.com; s=arc-20160816;
        b=VdYSUc01hUZF2bnrXFOY4U6N3HotO9g9eQREER0urxZuEh9qeXlGyvGkC0RGBVdsQg
         zonYkHt2V7BL/ZjYotyZLbaP3hRvVrq/LN6W/D3tbRLOaIDrlyZ1uORhT5aHCTZ/Kz7y
         AOrs8c5tps/dEH8Jv3a+Jd8nD/M6fzVrUKqgsg7OGNCgeOrSIKvsUyM7V6seowJJtBXa
         OMayriL27l2iC0fJ1AQuxgUiL8btpWLbgLVcQGxgat57kRL/g0wftCXATroH2HP4m1eP
         AqcfthKmWlParE7LI+VGzTXzMAEMm+bwYffzoOazcni23tBx2jrnw6qzJQ46MdKopDq+
         Ds+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+BEudxiwtgWHPsEpH1Pk2bDv+xFkbp1B+R0+aUd+t5Q=;
        b=nCTIRGsfTidb5l25kUgRLsOCZHTLFWx7daKt1Yx9ZEl5ticA0O4ZfyQhBXr8geAmLz
         3dgWZqQF+q0HvRXdFE+5Ac1tFo2zFL003LbtmEsWS4jfzQ34/vtGietfVpBD8Ocos+JB
         cNnFRXtW/bBnIbCf4ihwtRnQ4YgLuffTF9cctHTB6KFsCD2+/gyn9uuDFjrBK4mvj6Zw
         FhwkMThHmsP8ZlIkadPue5+IWSlOvTABsI2GiEnaLJiA1ZTzEte1NyqAjnLVMg/JLDTN
         t0cK5aXi0nZpY4iB02VwLy+BlLB1i6mRB0SGcg6/GBOWgBus3ieulb28RYYkD5uGi8TU
         tDyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w13si503079ljj.2.2019.05.07.07.45.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 07:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x47Ej2DF028720
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 16:45:02 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x47Ej23F021608;
	Tue, 7 May 2019 16:45:02 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
Date: Tue, 7 May 2019 16:44:59 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 07.05.19 16:13, Hakk=C4=B1 Kurumahmut wrote:
> 7 May=C4=B1s 2019 Sal=C4=B1 08:52:46 UTC+3 tarihinde Jan Kiszka yazd=C4=
=B1:
>> On 06.05.19 20:38, Hakk=C4=B1 Kurumahmut wrote:
>>> 6 May=C4=B1s 2019 Pazartesi 18:19:07 UTC+3 tarihinde jeanne....@gmail.c=
om yazd=C4=B1:
>>>> For sure ! You can find the requested file attached.
>>>>
>>>> best regards,
>>>>
>>>>
>>>> Le lundi 6 mai 2019 16:11:05 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
>>>>> On 06.05.19 15:47, jeanne.romefort@gmail.com wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
>>>>>> ACPI DMAR is available, but my hardware-check fails with this
>>>>>>
>>>>>> error :
>>>>>> 	"Unsupported DMAR Device Scope Structure"
>>>>>>
>>>>>> I also tried on a HP ProLiant DL360p Gen8 but I ended up with the sa=
me error...
>>>>>>
>>>>>>
>>>>>> Any idea of this trouble ?
>>>>>>
>>>>>
>>>>> Can you share an archive generated by "jailhouse config collect"? The=
n we can
>>>>> analyze locally.
>>>>>
>>>>> Jan
>>>>>
>>>>> --=20
>>>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>>>> Corporate Competence Center Embedded Linux
>>>
>>> DMAR region parser is detected Device Scope size more than 8 byte.
>>>
>>>
>>> VT-d Spec at 8.3.1
>>>
>>> If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1)=
, the Device Scope
>>> Entry identifies a device behind one or more system software visible PC=
I-
>>> PCI bridges. Bus rebalancing actions by system software modifying bus
>>> assignments of the device=E2=80=99s parent bridge impacts the bus numbe=
r portion
>>> of device=E2=80=99s requester-id.
>>>
>>> This devices
>>>
>>> 1C.7.0.0
>>> 1C.7.0.2
>>>
>>>
>>> Current Script does not support this type device... Scripts must be rea=
d Dev Scope length and than it is read the DMAR file to collect correct dat=
a.
>>>
>>>
>>> Jan can provide technical information on this issue. I have no idea why=
 it's not supported.
>>>
>>
>> I think I was "just" too lazy to implement the needed logic behind that.
>>
>> The tricky thing here is surely the identification of the final bus numb=
er the
>> BIOS or Linux as chosen for the device described that way. It will be ne=
eded in
>> order to identify the device entry in our configuration. Likely, we have=
 to walk
>> the topology, first identify the bridge and then query that one for its =
bus
>> number in order to describe the device.
>>
>> Jan
>>
>> --=20
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>=20
> Hi Jan,
>=20
> I think that I have found a method to scan bridge device.
>=20
> 1. At DMAR file get starting bus number device and function number.
> 2. Open the target pci device config file.
> 3. Check Type-1 configuration space
> 4. Check primary bus number at 18h with DMAR starting bus number.
> 5. Get secondary bus number at 19h.
> 6. Return Secondary bus number, secondary device number and secondary fun=
ction number.
>=20
> Dou you agree?
>=20

Yes, that sounds good!

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5c94104f-c27d-9074-1990-61fa9e9d05c1%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
