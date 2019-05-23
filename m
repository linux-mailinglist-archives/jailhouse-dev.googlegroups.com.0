Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSVLTLTQKGQEC5UMUQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB827D0D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:44:59 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id 18sf8888339eds.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 05:44:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558615499; cv=pass;
        d=google.com; s=arc-20160816;
        b=N9kFzTkYKx/gai7ez0F3pPADycZHdLoH5Fwg//iEp1N/UJWZB6FqWe4vLHYGHRyqPF
         fUWlaeCCkS/qOHFXQdWWHZCWKMcOA/S3OEkiWuYAwySXo0ZI2xCag+1xL9y+/u1K/N/L
         SATDiNjkikUbcV/vAolmFSXQQ46WXrrPlOixzXxZ4P4EcNn6hBIfKFjHTa/Knp1GkakS
         R3WaEa+qWp/GeCsO/7CorfrWwgvs4V/AEinckyQn71bWYsVlBLLvwOF3FKmsk7m5omoA
         ZXRhaQVplTz6C5iYT6eszWDw49nwzB7pFXF0/ySsyxk97Sz+zcozKcpJDCKMwouFPnN/
         hU1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=47ncRFwmAUpWrd9e2t8EIMF1HszdVJCXPetQdxDpATs=;
        b=QiMmkEW2VztRonyXe5wwGyhjgY7HSNI1KrRgvV1x/2qmqqf6V0nJXSc5aJsgXs7qCQ
         r2qV0Dwqe+9IipQmVaaRty30VGS/d9FzfneLqp+gLFjOyrEIxju5IoNabPnwFqOUdISV
         RCTuGMinxbKAmaAuxZvWbEv9PLhU9jJWA7LHyaTPqae6g8EWHYRwx7nYrXGOOBoz5t8Y
         70DiC3Cq9NVvyI+Gr1tXIR1G1ul9pT/DAprPiAVxpCFK7N0r6QkAesjzDe82+zOrEAZC
         fu3CCGJ+J4+QtuRIQFGUokXMcRzKEVfse5biBJLxxSft+ZgBaAx526CKSMC4jcGx2cff
         7CYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=47ncRFwmAUpWrd9e2t8EIMF1HszdVJCXPetQdxDpATs=;
        b=rlxCr3awLBdwS+UGjuHcgG+th068MVqtMoPfHg3MurkTnDMb7BOL2e54kaabEUH5M7
         JqFrQEjSGqBQUnpTBy00yvBVguM6hX3siV5Zj5YUhWp44dAp27cFSO9LUlh3JW4ZG1ya
         N+Nk5pFOL088p01g9qPCeTVI+fDZUWRD9W+F4n4R1sERSo39astbEA/+KjZzqzDnR5a4
         XWVu+8eBe93MIffB8ocvg5i05OaFYqr78+RvVLcVDE73oqlXBCRYHsPP6YUEAwmWvhaa
         pTIV6WmDMxAJfax7gJ1xSFIbPc3sG4DSdXBg853dmeRdaUkTkM+EphUElvveY6Dya74Q
         DqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=47ncRFwmAUpWrd9e2t8EIMF1HszdVJCXPetQdxDpATs=;
        b=W2ObOsy2Tr9fsFvYpKpInoQGs2+hQdHSm39ri8gkaUXQdds3d40pKhlZh4WWteghCD
         PLaGFH8Q7YDEoNSZSOoJ6eP0xTtWMPZqCmWXSCtu2HyiBjCW4xI+rrbTKFjg4C7r2q85
         2cP7orb8J0OygRbzDmsPaqS10s8ePSW+QtG3nrapP3ACeiJlVC9we4824vJBZcLIs7p4
         1yO0N89XXbzxIwwmmTj4YHfK9B6Veu2J2RDahrmcp1TzufnyGXmQEKmgYrIhEctX6Rin
         z63PNsFeZwzdRSRUq1NFNlfcdx7PIKcIflADmaqZAnc8c+f6AEE6Tkeil95bzXqh0h65
         ySaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWMKvtKZ7/g5QlfO/sM2UqHRaNLdIazWGTp7Vp9IFrFZgPW033k
	ROwoTZ9B3KW6hddqEzgQtMk=
X-Google-Smtp-Source: APXvYqzLgwpFUp7H7+0PT4Jt6LIIf+0MIXbum5gRpRT/3b98zz48jU0VIzaKv6EU07/lsKaiyKqnAw==
X-Received: by 2002:a17:906:8318:: with SMTP id j24mr63271817ejx.182.1558615498983;
        Thu, 23 May 2019 05:44:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d508:: with SMTP id ge8ls1348988ejb.3.gmail; Thu, 23
 May 2019 05:44:58 -0700 (PDT)
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr35526743ejs.15.1558615498408;
        Thu, 23 May 2019 05:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558615498; cv=none;
        d=google.com; s=arc-20160816;
        b=vQYHYDVZhQ2lMPcvIC8Y71JybpaKwtsxARHTcwI1Pg6iz5R+udfZPUwhWvTvxU/zxg
         +OGleiQxqt3+mFQqu9Ek6je84vK8PEyibmgJl4m1LM1l8/NFvNt69y5O4HY89jlYDmOs
         qLPyoRy67pkhfBcwFLWdOib7c8IpUPb029jCxlJEHVjpnOaJqNyF/R9UNqT14Yi/Qd/y
         ICnemQ2wGj7ZyLiae6QoSEbV+SF9+2Yo+VJG99uvtV5ppaeU2dHrNX/aPfeLdPLUCMXf
         ZjgsSxw/L8Qo7FJmgagr0km3vniKCAp0NVRFOuNZKiKuS3E0VoomKo9JIacYWheIlUoS
         TmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1Qs6eIhgWcZHdOczK0qLIBhRaTXWfAC/qwhhP6qWHRM=;
        b=N2EBuCVQ8BBbdDMEP/Flng7tTYQjJL2Vo3Ss05WJvragGil9RdIxzCPXe2/wYSX9Ll
         hNdU4OGwaf0Pz9bAG4rGT0NWlA+vyKt7FvRDNj3dUJfAUdlIcCX5xrNBj8vzb/maIVNx
         qwrpw7VDK99r6qAuc0bpAxj2FfDtswpTYJ5bJwOInForYmVF6sxIk4ILaHQM4L/GmnTn
         MhEGZJi+uzfFeVky5+INPeT4fF2VtDjcOLDLyUsSacjDmgbzHWfJdNGvaAUce4u71krd
         9J18/c9lqB8AXuinbhXGmFpcFN/qVa4VrB+XONzTspsikc5F29Cv63uN+5R0FLCKHKTz
         vbJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y22si72360edd.2.2019.05.23.05.44.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x4NCivm6028714
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 14:44:57 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4NCivVw032251;
	Thu, 23 May 2019 14:44:57 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, jeanne.romefort@gmail.com,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>
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
 <1300fb12-e2eb-1a10-e950-9f7c94e1071b@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3886ba1d-58e1-abb4-27b6-23b09863c6b3@siemens.com>
Date: Thu, 23 May 2019 14:44:57 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1300fb12-e2eb-1a10-e950-9f7c94e1071b@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 23.05.19 07:59, Ralf Ramsauer wrote:
> Hi all,
>=20
> On 5/12/19 9:51 AM, Jan Kiszka wrote:
>> On 10.05.19 15:11, jeanne.romefort@gmail.com wrote:
>>> Hello everyone,
>>>
>>> I'm still trying to get my rootCell running. I have for the moment
>>> connected a serial port in order to have the logs in full (in ssh the
>>> communication was down before I could have the logs). After solving
>>> some minor errors (such as Invalid MMIO/RAM read or IO-port) I find
>>> myself with an error that I can't explain:
>>>
>>>
>>> VT-d fault event reported by IOMMU 1:
>>>  =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>>>  =C2=A0 Fault Reason: 0x22 Fault Info: 38000000000 Type 0
>>> VT-d fault event reported by IOMMU 1:
>>>  =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>>>  =C2=A0 Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
>>> VT-d fault event reported by IOMMU 1:
>>>  =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>>>  =C2=A0 Fault Reason: 0x22 Fault Info: 39000000000 Type 0
>>> VT-d fault event reported by IOMMU 1:
>>>  =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>>>  =C2=A0 Fault Reason: 0x22 Fault Info: 3b000000000 Type 0
>=20
> hmm, sounds familiar.
>=20
> On a Dell T440, we have the *exact* same issue with a similar card: a
> BCM5720, pretty similar to your BCM5719. See my thread "VT-d: IOMMU
> exception with unknown fault reason"). And yes, there we have an active
> link on it.
>=20
>>>
>>>
>>> Is the new sysfs-parser.py the cause of my trouble or is there
>>> anything I missed in the configuration ?
>>
>> Could be. 0x22 means that the device is not present in the interrupt
>=20
> We have no modifications of the sysfs parser and face the same issue.
>=20
>> remapping
>> table of IOMMU that is responsible for that device. Try changing the .io=
mmu
>> number for that device from 0 to 1 or the other way around. Or is there
>> no entry
>> for 03:00.0 at all?
>=20
> Jeanne, were you already able to solve this issue?
>=20
> I manually parsed (my) DMAR, and there's a ATSR structure (type 0x2)
> which is ignored by the config parser. Could this be related to this
> issue or can it simply be ignored?
>=20
> In this system, we have four iommus. Mario, did you already test all
> possibilities for .iommu (0, 1, 2, 3)?
>=20

If that doesn't help, instrumenting what Jailhouse programs into the interr=
upt=20
remapping table for the device in question against what is being reported w=
ould=20
be the next step.

"When the Fault Reason (FR) field indicates one of the interrupt-remapping =
fault=20
conditions, bits 63:48 of this field contains the interrupt_index computed =
for=20
the faulted interrupt request, and bits 48:12 are cleared."

Maybe, for whatever reasons, Jailhouse does not transfer the remapping tabl=
e=20
entry that exists prior to Jailhouse into the table that is formed during e=
nabling.

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
jailhouse-dev/3886ba1d-58e1-abb4-27b6-23b09863c6b3%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
