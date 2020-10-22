Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWGOYX6AKGQE7FK5LPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36B295D26
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 13:04:57 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id e29sf240164lfb.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 04:04:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603364697; cv=pass;
        d=google.com; s=arc-20160816;
        b=yu6x0SL9Yuc+bnZm30lYjqXKFy292b3bvnmpYDcSNjS5OMOrI3xGyhOC08cUN4d2CX
         ntL9R6D4pXnNfL1axipFD3wbLXxomMbRnqjQ57yyrAP+NZmadEB+ROPXwm5w+++LQtlG
         lFm1BKM9cSB0Z+57PjaGq1084eNo0x1D4lm+e/cyJEG0xf4k3CpweTCMqF/HMSHTY/L2
         TJm4z2AMNPulfI9H/40PFt5RtpVUFQfnIFQvfb/NGd2PiC4xQec226rIX2ZWx5X0OZvK
         K8Km8PgdvKTJUUGtt+I8Kq5U72SNkht0cJzQaPGClN0TJuZAyZ39U0UTDBg/670Ax9uG
         qh+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=S7Vfo4yHL9dcvxna/24n//z3MRqWAOikI/G6H8fNaco=;
        b=I/rx6u8EBpGmLjKeBapbPknC+PuG/kcGl/CtVvw8/IzMtgLnSkZi45iY+FnqKNzil9
         5FGuwJ/Hbt6oSzKPaDoBXeU6qRl6ywTyaRjqIOUM/17camuTat1BbVbCHsyL+T5oCmbN
         GKmiORNEO4tbpZPWt6dwj94VHuS+ELLuLElDZv3wKKdGF3ITRr1CyxX/9V0RZkPl/jWR
         TVoDcLjvIoMWMNbTr3pZu3kDa5LIkjL3m7kpc4Lis9E4k/UNEZpFFDZxh6FNKWQC+id+
         0O/mWF5TVDV0HgUYX30rDDFfcnxr4VndvJlXe75BKjcqcka5rnAU7NlcJbKQ9faUgKYF
         /xRA==
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
        bh=S7Vfo4yHL9dcvxna/24n//z3MRqWAOikI/G6H8fNaco=;
        b=JsApSA9Tlhj+898JxX2QJk+/Zo84hlTCNXbgoEEYMoWBosCPoqyzia0RKM50ErFR2N
         8s29zd7zzCCVyEAzeQktXNzFFgWCBveDDznplTdS5Sq8EvvI/NV0Uo0VieZS38XaJprB
         T94kNfCzRmPIN0bBrBm0bqzQRihjmw+UweXj/+ar6EyY7BkpBfCRLVteu2oDgmxqcXLP
         x9ebwVUspG5NqfahKvz1ozLTjpOUgRImf2iVo6u9zFfS9WTPG5XEZfgsxNXJY1PuCZK+
         M7ohCbyvxELHyLRMfgiALAGHtQW3wG8KzwJaF3is1Ihp9hFm9ijpuKv81q0TBSUm8bz5
         OxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S7Vfo4yHL9dcvxna/24n//z3MRqWAOikI/G6H8fNaco=;
        b=PcMeN2jTIm/AwXDoNMyVz1rVyZIc947xWwdmbk2wRTuSjbzTFGle2vISBpZTNR1ZU0
         O113TlKAuxuqbGPAVP+sk84DKWHiih9k0W2AxM3gposs4u2/oc0k3y+TOBeikKCywAKF
         3m+fvDyIdtWk+SRM5ptrW4/vPNP7xl3nUGocpIpbeIDch1ZQffJl0IvFKtj8SJ71Cbs6
         bH6irPPfy+KrnJQqHgxFvDXHHSxj7yKJvZyrWqxZfdI0tpJS/xGy+4tx4SNXnJ5gRHfp
         26/Lo+WtIox3YRDc9dp0FJTmD2yb6K1rvhLvuRhIsk3FVEyckkJQyob4pQhM6+/t28ZQ
         5GJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/MTYXASQwdSn6kwkvD0tHbzYKZBgcOtkLbfb+Rlc0KRVF1VXV
	oSWihavvTniIKo9fGC9/ouE=
X-Google-Smtp-Source: ABdhPJyTRE6Ic54AUBzM4jEppB9VHGZ6FjhdTWGozinw/0KQy/CDTQCsAUMmU0xGoD8xz8sX/kXAuQ==
X-Received: by 2002:a2e:5016:: with SMTP id e22mr826436ljb.301.1603364696987;
        Thu, 22 Oct 2020 04:04:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a86:: with SMTP id p6ls254365lji.0.gmail; Thu, 22 Oct
 2020 04:04:55 -0700 (PDT)
X-Received: by 2002:a2e:b5b9:: with SMTP id f25mr808083ljn.309.1603364695631;
        Thu, 22 Oct 2020 04:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603364695; cv=none;
        d=google.com; s=arc-20160816;
        b=ZllmRPdrVomBV7mvz5p6wFbliNEDtS1gyCVLtRWYXRoaT6m5yFWldHdt6SXsafa6Rm
         8cMSyktdGJew1frVgPbOJOPk8h1vsJamCZhf7BHX6ZsTrronn2LAJVlc8yL2RsN1OVu8
         yN1Lr31JV+r97rzC+M17Kuxp6LzFE+YLBh805jK14Wy9JsTxhk/2gFMiTtV9VruV8PeF
         9dMCGSG54IT4xQR8CQw0jVIsAVxAhDhGHFriX5B/PcWKGC1QXSLmM6QbliRPhBeF771A
         GKsh81UyYd2NX6TOoCrL4NqxpU74xhIJcCJS5OXy1t/LxHUfM4WeJH/dgWfziC0cogeR
         xWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JLSRmiGacoufcz7Qz/AC5l72+F6rl2tCcUM0qpkgGl8=;
        b=HsDvDqBFn7NUubzZgdYTj4Ws4aWKoU2WBDnrMaN7/ZzUUvR5B442RoKaKsvIvLIk1w
         pPAdKZwIV+XDJgnk9wioh+vIRyDSfo/VDBlmJKDL1A1pq7Mu9w16vNTbAlqapxBj728X
         yRkFb7FCfT51PL93VGNZFL2QpkZQZTSAU8gWlMGmyLID1sV2iriUflbDFTVuQVDgqyHz
         Yu6Bhe5GH1CnxQFMndObXLfyOhwO2OHqF6pM14HOHnngvS3ZOxm6JZi6hz+UpbAWt1Bz
         jA/kcP/gEPNxuyHq36UH6nisHg6RwK0FYgqZwVwNK+4iR4jU0KzOJQa4iPSLsXEDXZYt
         hV/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i17si53982ljn.4.2020.10.22.04.04.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 04:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09MB4s0Z001826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 13:04:54 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09MB4r9I003968;
	Thu, 22 Oct 2020 13:04:53 +0200
Subject: Re: Jailhouse in qemu and ubuntu
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrea Bastoni <andrea.bastoni@tum.de>,
        Jari Ronkainen <jari.ronkainen@unikie.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
 <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
 <8e259404-32c1-7e23-d790-a5c52d800795@tum.de>
 <3f1b6c78-46f8-424e-7114-11d29103b325@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <415463ca-566b-9061-77f2-be88125e1f2b@siemens.com>
Date: Thu, 22 Oct 2020 13:04:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3f1b6c78-46f8-424e-7114-11d29103b325@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 22.10.20 13:01, Ralf Ramsauer wrote:
> Hi,
>=20
> On 10/22/20 12:09 PM, Andrea Bastoni wrote:
>> Hi,
>>
>> On 20/10/2020 12:19, Jari Ronkainen wrote:
>>> I noticed that dmesg gives me
>>>
>>> jailhouse: not as system configuration
>>
>> I'm hitting likely the same with Ubuntu 20.04, but not under Debian test=
ing.
>>
>> It seems that the .note.gnu.property section is interfering with objcpy =
and
>> causes the "JHSYST" identification to be removed from the .cell.
>>
>> Removing the section while copying the .o fixes the issue:
>>
>> objcopy --version
>> GNU objcopy (GNU Binutils for Ubuntu) 2.34
>>
>> readelf -a jailhouse/configs/x86/qemu-x86.o
>> ...
>> Displaying notes found in: .note.gnu.property
>>   Owner                Data size        Description
>>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>>       Properties: x86 feature: IBT, SHSTK
>>
>> hexdump -C jailhouse/configs/x86/qemu-x86.cell
>> 00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |...........=
.GNU.|
>=20
> And the Gnu comes around and drops its own magic cowpat. ;-)
>=20

Hehe :)

> Jan, maybe it's time to use a linker script for configs? This should
> avoid such errors in the future. I think we have already seen something
> similar in the past.

I think it's rather time to make use of pyjailhouse, define a simple
yaml equivalent of the C-based config format, and generate them without
any C toolchain. I just received (valid) complaints about all that
fragile num_whatever_elements and indexes again.

Jan

>=20
>>
>>
>> objcopy -O binary --remove-section=3D.note.gnu.property
>> jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell
>>
>> 00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST.....=
....:|
>=20
> This reminds me that I wanted to write an extension for file(1). It'd
> really be helpful if file would be able do determine if a file actually
> is a configuration, and then if it is system or a cell config.
>=20
>   Ralf
>=20
>>
>> Maybe related to:
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D906414
>>
>> Thanks,
>> Andrea
>>
>>>
>>> , but this is the example .cell file that builds
>>> with the source code and is used as an example
>>> in the README.md?
>>> On Tuesday, October 20, 2020 at 12:56:36 PM UTC+3 Jari Ronkainen wrote:
>>>
>>>     Hi,
>>>
>>>     I'm interested in running ROS2 in a Linux cell, first through
>>>     QEMU and later on Up Xtreme board.=C2=A0 Apologies for stupid
>>>     questions,=C2=A0 and please refer me to a more appropriate forum
>>>     if this is the wrong place for them.
>>>
>>>     First I have built a fresh virtual machine and installed Ubuntu
>>>     20.04 LTS, then installed linux headers, build tools and python
>>>     through apt.
>>>
>>>     The compilation and installing seems to work fine, but when I
>>>     get to the point where I should do
>>>
>>>     # jailhouse enable jailhouse/configs/qemu-x86.cell
>>>
>>>     I get an error message
>>>
>>>     JAILHOUSE_ENABLE: Invalid argument
>>>
>>>     I do not know how to get past this, any help?
>>>
>>>
>>>     Other things is it seems like the documentation is not entirely
>>>     up to date, and I noticed things like experimental virtio support
>>>     and IPC reworkings in 0.12 release notes, is there any more info
>>>     about those in the wild or should I just dig through git commits?
>>>
>>> --=20
>>> You received this message because you are subscribed to the Google Grou=
ps
>>> "Jailhouse" group.
>>> To unsubscribe from this group and stop receiving emails from it, send =
an email
>>> to jailhouse-dev+unsubscribe@googlegroups.com
>>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>>> To view this discussion on the web visit
>>> https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8=
-50a39589bd88n%40googlegroups.com
>>> <https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe=
8-50a39589bd88n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.
>>

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/415463ca-566b-9061-77f2-be88125e1f2b%40siemens.com.
