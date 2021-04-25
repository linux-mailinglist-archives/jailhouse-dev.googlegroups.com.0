Return-Path: <jailhouse-dev+bncBAABB4MFSWCAMGQE2XVUG7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5636A699
	for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 12:22:41 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id j16-20020adfd2100000b02901022328749esf17320883wrh.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 03:22:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619346161; cv=pass;
        d=google.com; s=arc-20160816;
        b=U8wxZ66o+z9TQcRLNXL609nYje6lmVAYhzS9+4KpYxqlFNHrovRO/giNbN4D+5odKp
         gxadtf9C+YcMUIIQCCB+K5dTxZkNI2uOef3Yb1iQkzQJRyeZ0qwyywdoc+wG4aSTor4e
         QS5CWNv9BzXhGIzdBe5g7uldG4yi8DjBcC7U7nKkpcyudxxZyvzFmgF6ypl8WxAS6/Ie
         lLy3Awo64coScbcDnXCIW32LjIPlUSPXYnb5XTWDSNosQW4KgkZlj4TK77nCa7hHnxHe
         AZxGPjWQP2OyOIpGztOgQ5/VT3soeqLHGnu9ImENBT3KOlkYBakNUpOIuBmYJSZ+G7TP
         qNAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=vYSkrTUcQiXHrONgXOdj2p1xf03t3BdfWw90HSRT5lM=;
        b=ekiM+x2D1BCs4yxUfeblu9/PGSBVlHuUeLNjoS7axgBlickvSId6BLXW2oNgbK/gl2
         FKMkf4bgZKhJRYxRlyTNCH+ryA0L3SGHaf2ndnUUnhsnAG9XHfKQSIVJmMGHSSL1UYGq
         WYhFzP3iS4XUnQAnH0nbeJVhCXbjPHdS/4vW1AKO0QK2/MmdmP8XkmSol7UX5q4Kqi7e
         Cttq7ApXXJFzkTiw1WS0OlJacFz7v2/xkE/i10vyv2vm1EGWvVaylPPVA8ookBTt30uB
         f4VIxwQ4QLQsGycPo+O6TipzKFOQUMPpXxNnFsN4jKU5TvK6CeM9zff+wL1C7zUsoE5k
         p4oA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.b=raXrDLvZ;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=tbhzQM0D;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vYSkrTUcQiXHrONgXOdj2p1xf03t3BdfWw90HSRT5lM=;
        b=QvkrUeijMIGcAM3xo00PtrwVjvxE/gtmPdvSVMxe4uVwjvgFvpn+q6ll86ZMxdzVD4
         TIC161SiMhE5GqZNAHa43wmg8IRAqE8sN+GsYzCsc8WR8ilx0zA0h02vIzOAYg3/za7E
         HvZANfXQo55oETcMtpEHOJlScWZr9Bjg9Y613NsOFxpfQ6KG/1OIHKqe8Q5+cJYmK9vz
         97OSQzjRjfiA5e/yeiEJhLKw6QsnqdTri1thY9EHLgouv5HK2x3Vw23nO0lzlzTmyfPS
         DnXru7a+KpzFneVT7ud2imJKBx5QPwH5tTXe68S9zCtdYL2KylbREWt8eh7ZPmy8XR1C
         f4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vYSkrTUcQiXHrONgXOdj2p1xf03t3BdfWw90HSRT5lM=;
        b=hGwAzkL4MrF+Q2jaQC7WRcxZs43gwsEui4xi7tNQh3Z/1PYej87J23DehDaVUmoxwZ
         +cBJQ0045U9wQPBkKVaMIlw2h4wPX+VHWYjh5cE/LGm207k72nL0p+jQBbfjBy7wZMug
         CPD62s2f15rBq1ssCX6YULxI/pGB/dr7cLi7zA4CNUwlO5ZdJdt4wpUCH4f422l/s+W4
         1U7jZlKxD7lgp27Zmbw7pc12BYQAcgg6miU/sf0AkcSgxnkgSnGwNi9u34u+t4L1jJLX
         BDX3vV/A+MwrJCPhw/f0ZwhvjZcwKT1CXz1oDrfj/X7vGMz/dCZFJZdi/OUcOr/mG7fn
         3oIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/1ILA8a3j59I0Jm1wMRoCsDQV7F68g/JlJ/1ChYNxC49Gs3Nl
	PyooUK4SyRpKeErNDUPP3so=
X-Google-Smtp-Source: ABdhPJzLH6CemKkJmzJzQBLnDlJlDcpeK5k7XMBBAj9g8C/gA6S33dcItULg2CP/hR5X0tLGhSXTwg==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr16587375wrp.115.1619346161408;
        Sun, 25 Apr 2021 03:22:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:64c2:: with SMTP id y185ls101178wmb.2.canary-gmail; Sun,
 25 Apr 2021 03:22:40 -0700 (PDT)
X-Received: by 2002:a1c:e444:: with SMTP id b65mr13833127wmh.49.1619346160668;
        Sun, 25 Apr 2021 03:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619346160; cv=none;
        d=google.com; s=arc-20160816;
        b=0yM6FdEDYkWZI3wHkx3sJBpk+hcUnUUCvGdpk7P6DwEtLZueW4AAC45rRnR2eSGf//
         BTu65Optjd2hRTHAlVoTgc/5kcUUJMUR7kHJl4uKpc4tU9iVMOMRQEywA47V5+DuRQ1P
         B4CmKsXSmoahSxonCnJ/aIYlJ7OahaZMNsYrUfUuXRymuAt+lq0BWlWchwCfn4zQYV+S
         aZeA7Fcb/8xdIznu38dhnhhVK8KZYubPMbQrGdnilpo+Qi+uk1acdntsd9d/wxEKfgZU
         17FVu8OuODr7I29BaiFYxmBBr+slCVACwpJ5l1rdSOOVgB+L/GcFBaoMq56OmOg2VMoP
         6Qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=WofO2O8Nb4ThE3j3hmNcJCM/8h4gg3AadwngVQ0XP+c=;
        b=KINK/obW1aS4qg0Mh4T1trIfP0fOQsog2GZOMxbZzjiQA0LiLZYxJ/ztQk4b8EdPI/
         n8U2cKoCjXOdXjtFv0RXXKIKKPHqM+so0ppAIheVr09XfHIDRifgE8EiSnKtsAlyp/qG
         2XVkRTZPOxiQn8fo2eGBvmfjz/kx9dEyxPrqVf47CUs5DB7EtzwdFaWDMTYdb5zSn1PK
         UUlSBHGeSATWmE3xCqVdNFyMjerszqipIKv03WqxBJ5ypOfla9NS+8VHNl4JL2ldUHK0
         Iltdq0OSNdKuPdN1CvgEnDT7Xtdw5oxFXPbtVYdT6fthJl7jsa3JHM2G0x9KFQ7Vs+nd
         C5lA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.b=raXrDLvZ;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=tbhzQM0D;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id k6si985239wrm.2.2021.04.25.03.22.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Apr 2021 03:22:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.81 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Sun, 25 Apr 2021 10:22:37 GMT
Received: from Pickup by email1.uni-rostock.de with Microsoft SMTP Server id
 15.2.858.5; Sun, 25 Apr 2021 10:22:33 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email1.uni-rostock.de
 (139.30.22.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Sun, 25 Apr 2021
 12:20:29 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0858.010; Sun, 25 Apr 2021 12:20:29 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@web.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: [EXT] AW: AW: Inquiry
Thread-Topic: [EXT] AW: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQwgApfIwD//qzLwIAD6CkA///bZqA=
Date: Sun, 25 Apr 2021 10:20:28 +0000
Message-ID: <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
In-Reply-To: <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.78.26]
x-tm-smex-dtas-header-wtp-uuid: 4B835D8666CB98209A18D43EFB1351488A9DEBAD
x-tm-smex-dtas-header-wtp-flag: 33640B51CAB57AA67DC6A779B1ABA72CCF3588B20000
	9d3cd0fe-bef0-4dcf-8763-631049659334:BC4A395C517E27D5DC5D9D61FE921023AB7115
	3C0004e51ad4bb-1c9a-4d68-b95d-b7d3f1dd14a4:E86D7FA298E5BF5C91B1B1620E328B6A
	9CBADDE50000902801c0-cffa-4a95-836c-7b66a5e49e45
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26112.007
x-tm-as-result: No-10--15.790900-8.000000
x-tmase-matchedrid: FylJuUDaq5MMPDZrnvcM98CxC+PryYbTgdkHykGcMpkDwV9jYWbSU2O2
	7X3o/SbCbtAD8fpuJtOd0LObCu/HeH7y2b5rEaOs2nbn21FyrGciJN3aXuV/oTL/GHoao0dViUc
	gnKd9w06ulh2vNaMf+pLF1e+QMk+eG9xcMkaD7s4usf7/6URPRbCouBF2/ACKb8zqAERVGSlMgk
	9+iOMVMiYdu2t8EhPvxkaSSVZFxZ5zbOi1xi7r+PHkpkyUphL9m1xhXnxxzmL+Aw16GgqpO7kvj
	l+OJB+kyW/TMVR0k3kmpQhpq1gcuHfkh9kJuRvXuLHENGl+3A/hKQh1LCmGBkYx760ONDcWXnmu
	BT+Y9/Jzu+lgojmun9b1cZJXYs/UU82qMWBUBVCnIRazgfZGp/Wr7HvOSElaDSG7dmYh9boHLJW
	KaOYkk1VEtbgDBaWtXO/yVP5Gyz6v2IUap2dLCi8s/ULwMh46AQ+35UHH2f165yXsx03DxG6wMq
	aUrL2tbHelySiuVU9omBPpmX3zLE+YFR+Qf/Vw9Ib/6w+1lWT4qCLIu0mtIAaYevV4zG3Zoh5On
	tQGGFFnaShipTcsDk4DAdCXIuznJfIWymiJxrjC+o4YGuB7ez/AwgScsQyZspC+xydJZuP4BxLg
	SYIA5Xb3FDWL4Q1Dnk46wH9bwuMdvdjzPI2NBSoiRKlBVkYIGIMg4+U4kbUn1R+2am/6Yxwz72z
	DzvkOCQeiUZjdR39zwA2B/BVZs5BuyrHhdqZBjpyluct2Nr0L//VMxXlyEygVbxW7FDOVwSy1gF
	d2ZtgjF2lb9t1ZoAwPFp97yTjAk0i76rQKzpKrm7DrUlmNkF+24nCsUSFNBLPx9cDMrKb9b0xgY
	rma7dRnEQCUU+jz9xS3mVzWUuCgZHIBpyeFpuKWLPiMKeRWpJeEeM7he0XPbcu8httAL42lp7Bi
	j7FdftwZ3X11IV0=
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--15.790900-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26112.007
x-tm-snts-smtp: 998C93FC261654E6572C03E438292509FC5C3292633444CCC5FE5532E2CF54E82002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de header.b=raXrDLvZ;       dkim=pass
 header.i=@uni-rostock.de header.s=itmz header.b=tbhzQM0D;       spf=pass
 (google.com: domain of moustafa.noufale@uni-rostock.de designates
 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
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

Hi Mr. Kiszka,=20
I have one machine with:
Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
The setup is win10-> Ubuntu 20 on VMware and I found this while running lsc=
pu:
Vulnerability Itlb multihit:     KVM: Mitigation: VMX disabled
Vulnerability L1tf:              Mitigation; PTE Inversion; VMX flush not n=
ecessary, SMT disabled

The other machine has Ubuntu 18.
Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz

Both have virtualization VT-x.

I think that I do not simply have access to enabling VT-x from Bios setting=
s.

I am thinking of buying a Pi4 and try Jailhouse on real hardware, would tha=
t be a good idea?

Thanks in advance

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@web.de>=20
Gesendet: Sonntag, 25. April 2021 12:05
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer <ralf=
.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
Betreff: Re: [EXT] AW: AW: Inquiry

On 25.04.21 11:32, Moustafa Noufale wrote:
> Yes, the machine is working and jailhouse is present in the list of Modul=
es. However, when I run this command:
> jailhouse enable /etc/jailhouse/qemu-x86.cell I get on the QEMU side "=20
> Input/output error"
>
> and on the terminal:
> Initializing Jailhouse hypervisor v0.12 (0-g92db71f2-dirty) on CPU 2=20
> Code location: 0xfffffffff0000050 Using x2APIC
>
> Then I ran jailhouse hardware check and everything is available, except f=
or:
> "Virtualize APIC access             MISSING"
>

Also when running on a native Linux host? This is unusual. What CPU do you =
have (lscpu)?

Jan

> Then I tried to figure it out with different ways:
>     sudo modprobe kvm_amd nested=3D1
>     sudo modprobe kvm_intel enable_apicv=3D1
>
> or editing the kvm.conf file, but with testing with the following command=
:
> cat /sys/module/kvm_intel/parameters/nested
> returns Y and it is okay.
> cat /sys/module/kvm_intel/parameters/enable_apicv
> it returns always N.
>
> I tried two setups:
> 1- Ubuntu 20.1 as a VM on Win10 machine.
> 2- Ubuntu 18 as the main host machine.
>
> Thanks in advance
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Gesendet: Freitag, 23. April 2021 20:40
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>
> Hi Moustafa,
>
> On 23/04/2021 15:04, Moustafa Noufale wrote:
>> Hello,
>> I would like to thank you for your support and maybe you can give me a l=
ittle help with building "jailhouse.ko"
>> I have tried make, make install with and without root in this directory =
"jailhouse-master/driver" and I am not sure if I am following the correct p=
rocedure. What I have done so far is building an image of a virtual x-86 th=
rough running ./build-images.sh and I can start it using ./start-qemu.sh.
>
> Okay - so you did build successfully build your target with jailhouse-ima=
ges, and start-qemu.sh gives you a running qemu instance?
>
> In this case, everything is already installed and in place. The jailhouse=
 module will already be loaded - you can check that with `lsmod`.
>
> To enable jailhouse, you can simply check the history of you bash, or hav=
e a look here:
>
> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/c
> ustomizations/files/.bash_history-qemu-amd64
>
> HTH,
>   Ralf
>
>> What I have understood from the tutorial is that I have to inject jailho=
use.ko into the kernel and then start the guest.
>> Thanks in advance
>> Moustafa Noufale
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Gesendet: Dienstag, 20. April 2021 11:39
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
>> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
>> Betreff: Re: AW: Inquiry
>>
>> Hi,
>>
>> On 20/04/2021 11:29, Moustafa Noufale wrote:
>>> Hi Mr. Kiszka,
>>> I have tried to  build an image through running "build-images.sh" with =
and without root access:
>>>
>>> without root access:
>>>
>>> Select images to build (space-separated index list): 1
>>> docker: Got permission denied while trying to connect to the Docker dae=
mon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocke=
r.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: pe=
rmission denied.
>>
>> your local user needs to be in the docker group.
>>
>>> See 'docker run --help'.
>>>
>>> With root access:
>>>
>>> Select images to build (space-separated index list): 1
>>> Error: Running as root - may break certain recipes.
>>> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to o=
verride.
>>
>> Simply read the error message and follow the instructions: If you want t=
o run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environm=
ent. For good reasons: You shouldn't do that as root.
>>
>> Anyway, solve the issue by adding your user to the docker group.
>>
>>   Ralf
>>
>>>
>>> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizat=
ion.
>>> I would really appreciate it, if you could me a hint.
>>> Thanks in advance,
>>> Moustafa Noufale
>>>
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: Jan Kiszka <jan.kiszka@web.de>
>>> Gesendet: Samstag, 17. April 2021 11:45
>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;
>>> jailhouse-dev@googlegroups.com
>>> Betreff: Re: Inquiry
>>>
>>> Hi Moustafa,
>>>
>>> On 16.04.21 10:29, Moustafa Noufale wrote:
>>>>
>>>> To whom it may concern,
>>>> I am a Master student in Rostock University and I am studying=20
>>>> Jailhouse this semester as a Master project and I would like to=20
>>>> gather information about this Hypervisor, as well as I would like=20
>>>> to ask, whether it is possible to install it on an Ubuntu Virtual=20
>>>> Machine? I just need an outline, how I can learn it. I spent today=20
>>>> reading the code on GitHub, but I need more information and appreciate=
 it if you can help me.
>>>>
>>>
>>> A good starting point for experiments can be the images generated by [1=
], both for KVM VMs, pure QEMU emulation target or also real boards.
>>> Note that emulating target inside a VM will work but using KVM (for x86=
) may not or is at least fairly slow. I would recommend a native Linux host=
.
>>>
>>> Then you will find a lot of presentations on Jailhouse on the internet =
as well as an (aging) tutorial on how to bring it up on new hardware.
>>>
>>> Jan
>>>
>>> [1] https://github.com/siemens/jailhouse-images
>>> [2]
>>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2
>>> 0
>>> 1
>>> 6-Jailhouse-Tutorial.pdf [2]
>>> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>>>


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c029ad37ed324934b2e0aa3f05ad1713%40uni-rostock.de.
