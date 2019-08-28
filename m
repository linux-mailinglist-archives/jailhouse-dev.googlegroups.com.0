Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHGJTHVQKGQETPJEZII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0FA00AC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 13:25:17 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id g127sf1847798wme.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 04:25:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566991517; cv=pass;
        d=google.com; s=arc-20160816;
        b=sz1NzP2jPAdjT6EQs9UymeYlneh8lwmb/DjRgOSAGzbDAmENBiNey3f0vRt7n2owKW
         4fomkEaWaB91plcLERe+RX0t0Ab2uYE04S8vhiBCEDB+UyWk5Z9Liz0mLwcGnMQ6DXtz
         zRo+GZfp28Na0t+XbymLNzUfeAdnsX1qpVu0V1gohC4aq6ZCqF/AfBbpcI5QNUTqz+YQ
         nws5S2fC7Gl9tSXThbmhwJg7I56awLH65VVoAqxhMipgErj5ClktXZef4XDVk5NAQuOk
         RcCVwfjfc9G0ycjs23fq7hbnjONcOWujY3dhcWEHEoCAXe7BIqlqeeVDgsXHdn4n9mpZ
         2G5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=gJl9aFccIT+T8t4XnP6TVhjMQjW8T7FRDide+CWendw=;
        b=LPy2h+FwBPhJk/burnlYa7keHYoK+pzpFE8SX6+Qf2MbdmKm0mr8TZjom0allo33T4
         u7/G+NPRlS29mpXAgdEQuqPvxm+JKN+I7YnezxujO4fqH0kAis+xMPIU9LYtIr8sxZgw
         1tafHnJUeJ1PLQquuThXeydkW2kO+lJintdqq4rpZAKeeaSi/PZ6W57SzCy/RULCZ/We
         bXrOPLBx0WzSk1/nvwFKCpvpfG1DcTBujNbkcIiIClEc1zFmFJVc7sHc3YM3Fn1hfM8+
         eXl9vh78FN9OT17pWSBRiZKLkT//tn9rbWnNHhdcP5fV9hMcVL7KrTkqzj89P28mAZQh
         IYhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gJl9aFccIT+T8t4XnP6TVhjMQjW8T7FRDide+CWendw=;
        b=fi1Y+ELi7XW7/iPXEUdEBaPMkGzo4F/1Mk6rbUT5NqelJWhlqE5wWM+FGQK/DBRb61
         4p6Nj7EDZKHqJpyaI1Uv2SzAoG84ngNSWz/+5nXKAy3+gwt2R8PRvl779N1yn4IkujXC
         JimP98+Z0zqiZJ8H84zCg8p3N1ww7tq7f58ht4Jb+Eh79NhrRCsCzeDTo1aXhm/RxkeT
         y3Lqy0tM8bjrGQofYp18pSECSz8egb7INjTHs/sUy9V9sFRI0iUkeCNapy8yRbAYekTQ
         UdUBagb4cSkRSOAsGo73QVIoP6/xNIdf68G0pp1C7mwEKJqZa7VMbf24oaYbI5q6adJ0
         Z93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gJl9aFccIT+T8t4XnP6TVhjMQjW8T7FRDide+CWendw=;
        b=S9YYVW2n+/maAHsAn/Hq6Mn92R3RYx8cIAsV3Gk2cW/Fow6E3QOTWS5kraPb/kQrLQ
         voT8R5J6z6brptRWdrXebubLoRWvDGp7KR29x6XRA413NzGfK6BxVHIhL89JiX+NtIuM
         H62e7qDiB3+Lp6UHNqfExO/SOua4n1XFKiYJFvjpnij4VoFIWGYiclnKqSLbr/z+701M
         DfnmIcP7Q45yDCMfdSv1RMer9b+w7jMUWC+9HniuzWrmPe5cLRG3gjIYJWFBkVNkxuFT
         s1MviSnkocdsa3OwOJtNsRH3ylZXBtW97ccEPv48NgWe+PTz4NN8OosAqxS+hXT63E+5
         alLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWKBsMOehWqHplPYlmd/yd056V+mKde3A5J+ETJY+WSnTgRcydC
	RSR1ib1xldXAJ88K96qgBgU=
X-Google-Smtp-Source: APXvYqzy6mnPt9UKFM/3qG9ESB1B98J2XiSBVzeFi836bVyrA6C/RlFdF/gE2i4Rz4u44CW/rr4SFg==
X-Received: by 2002:adf:e710:: with SMTP id c16mr4172766wrm.292.1566991517154;
        Wed, 28 Aug 2019 04:25:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6942:: with SMTP id r2ls653142wrw.3.gmail; Wed, 28 Aug
 2019 04:25:16 -0700 (PDT)
X-Received: by 2002:adf:fac1:: with SMTP id a1mr4278958wrs.56.1566991516286;
        Wed, 28 Aug 2019 04:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566991516; cv=none;
        d=google.com; s=arc-20160816;
        b=r8rXOg7Ebskm2zIrwB0gZqFkZv+DQKf/UkEs3wY2o+t9uuVKUmWVjlpAxu++s1cQLz
         mJAJwlSQWWTg52+zolDKR0c3K/4PPJBbT5nP5U0m7Y+Z/cU4joRpiq1bWScNdCYuKQG8
         VNAOqg6239390KKXcvC293eyAAS2BlgUWnak+LNAy8PIDUJtBfoji+HkKcX8KAunh3TZ
         6hEtbtjPXVvvu2Gy8mUgaIPk0IY1kLQip1YgyzTaNwmu5pnFkQHiLUlHy8UFHYCDTOC2
         gb8ZrZsdQQqEZjX6HsPA7TTW37nxdqLtH7sgrrwUkt4NESI2d2GcdG5wds8B851BU40U
         zWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YmYPYHLSJP9j/y3AAQUnE1R33hSerPcvWFuVBzxgeGM=;
        b=vVE3rjjtIHB6fbxWUEd8tvhcQW28+FeZoXkhav8txswaORAWUe2LMhCJ7vg2gSPsfN
         1eSkzU1bRxxI9PRayEX2o4g1Q4euND/mHFne4BhCN6cLOkuaW4IuuyIuuVs6w+4althy
         X0ZN17E5Mn18XrZsgPgDhC01vOgljOg9du5bn6Y+uRD0yjc0qJePaqP7ZYRd0g67xqI/
         k/KuTkIvUvzBnSdVm25v4d9ye51TNixDnulbw1PO8TzKAcscLiGsvhsGFeQMq+e7MG+n
         eig4vRQshTjCUoRD8Bpy/maopxX+TX2WdIhCGoD/JWdBi7nBBPLwQa2D1PqOuAjPI1fN
         yvZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id l14si115995wmc.1.2019.08.28.04.25.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 04:25:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7SBPF8b018774
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2019 13:25:15 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7SBPF6b007442;
	Wed, 28 Aug 2019 13:25:15 +0200
Subject: Re: Unable to find IVSHMEM pci-device on root cell
To: sebastiansaueressig@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <3335f4d5-d834-4103-a4fa-45b55164d430@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cc58cce9-a377-70f6-fb38-b24a9ba0e210@siemens.com>
Date: Wed, 28 Aug 2019 13:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3335f4d5-d834-4103-a4fa-45b55164d430@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 28.08.19 10:01, sebastiansaueressig@gmail.com wrote:
> Hallo,
>=20
> I'm working to the topic /ivshmem/ and still trying to connect the two ce=
lls.
>=20
> My setup is as follows:
>=20
> Root- and Inmate-Cell:
>=20
> On both Linux tsn-inmate 5.3.0-rc5+=20
> (http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/=
jailhouse-ivshmem2)
> CONFIG_IVSHMEM_NET is enabled
>=20
> jailhouse --version
> Jailhouse management tool v0.11
>=20
> Root-Cell:
>=20
> After enabling Jailhouse root cell:
>=20
> |
> root@tsn:/home/jailhouse# cat /dev/jailhouse
> <missed 188bytes of console log>
> zing processors:
>  =C2=A0CPU 1...(APIC ID 2)OK
>  =C2=A0CPU 0...(APIC ID 0)OK
>  =C2=A0CPU 2...(APIC ID 4)OK
>  =C2=A0CPU 3...(APIC ID 6)OK
> Initializingunit:VT-d
> DMAR unit @0xfed90000/0x1000
> DMAR unit @0xfed91000/0x1000
> Reserving120interrupt(s)fordevice f0:1f.0at index 0
> Initializingunit:IOAPIC
> Initializingunit:CacheAllocationTechnology
> Initializingunit:PCI
> AddingPCI device 00:00.0to cell "RootCell"
> AddingPCI device 00:02.0to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:02.0at index 120
> AddingPCI device 00:08.0to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:08.0at index 121
> AddingPCI device 00:14.0to cell "RootCell"
> Reserving8interrupt(s)fordevice 00:14.0at index 122
> AddingPCI device 00:14.2to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:14.2at index 130
> AddingPCI device 00:17.0to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:17.0at index 131
> AddingPCI device 00:1c.0to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:1c.0at index 132
> AddingPCI device 00:1c.6to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:1c.6at index 133
> AddingPCI device 00:1f.0to cell "RootCell"
> AddingPCI device 00:1f.2to cell "RootCell"
> AddingPCI device 00:1f.3to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:1f.3at index 134
> AddingPCI device 00:1f.4to cell "RootCell"
> AddingPCI device 00:1f.6to cell "RootCell"
> Reserving1interrupt(s)fordevice 00:1f.6at index 135
> AddingvirtualPCI device 03:00.0to cell "RootCell"
> Device300okay
> Pagepool usage after late setup:mem 347/974,remap 65545/131072
> Activatinghypervisor
> |
>=20
> Apparently the PCI device was added (03:00:00)
> "Device 300 okay" - is a debug output from me
>=20
> But I'm not be able to find it in the root cell.
>=20
> |
> -lspci
> 00:00.0Hostbridge:IntelCorporationSkylakeHostBridge/DRAM Registers(rev 07=
)
> 00:02.0VGA compatible controller:IntelCorporationHD Graphics530(rev 06)
> 00:08.0Systemperipheral:IntelCorporationSkylakeGaussianMixtureModel
> 00:14.0USB controller:IntelCorporationSunrisePoint-H USB 3.0xHCI Controll=
er(rev 31)
> 00:14.2Signalprocessing controller:IntelCorporationSunrisePoint-H=20
> Thermalsubsystem (rev 31)
> 00:17.0SATA controller:IntelCorporationSunrisePoint-H SATA Controller[AHC=
I=20
> mode](rev 31)
> 00:1c.0PCI bridge:IntelCorporationSunrisePoint-H PCI ExpressRootPort#1 (r=
ev f1)
> 00:1c.6PCI bridge:IntelCorporationSunrisePoint-H PCI ExpressRootPort#7 (r=
ev f1)
> 00:1f.0ISA bridge:IntelCorporationSunrisePoint-H LPC Controller(rev 31)
> 00:1f.2Memorycontroller:IntelCorporationSunrisePoint-H PMC (rev 31)
> 00:1f.3Audiodevice:IntelCorporationSunrisePoint-H HD Audio(rev 31)
> 00:1f.4SMBus:IntelCorporationSunrisePoint-H SMBus(rev 31)
> 00:1f.6Ethernetcontroller:IntelCorporationEthernetConnection(2)I219-LM (r=
ev 31)
> 02:00.0Ethernetcontroller:IntelCorporationI211 GigabitNetworkConnection(r=
ev ff)
> |
>=20
> 03:00.0 missing...

A typical reason for that is incorrect pass-through of the PCI config space=
 (PIO=20
ports 0xcf8 and 0xcfc on x86). Then Jailhouse has no chance to emulate this=
=20
additional device on scans. But your config looks fine in this regard.

Well, the reason might be that Linux may need a virtual bridge for scanning=
 for=20
a virtual device on bus 3. Try adding the device to bus 0 at a free slot.

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
jailhouse-dev/cc58cce9-a377-70f6-fb38-b24a9ba0e210%40siemens.com.
