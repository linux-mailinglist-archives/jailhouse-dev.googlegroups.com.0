Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBQMB4KOAMGQEWBOBROI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AB64B674
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 14:40:18 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id c187-20020a1c35c4000000b003cfee3c91cdsf4838534wma.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 05:40:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670938818; cv=pass;
        d=google.com; s=arc-20160816;
        b=AvicXfTCO1cO563LVIPeBh9teSYYGy1+dl7Qn+IWohXOdDA0HgMPizIcajZ1NgR5qf
         zhTvP1XDahk0+LEQ+zAu8/LSoFrKWPYTrPqkEL69yMiSC9Ax/EkOg3jyogM02wfl0IUH
         ph7PZdfsPcW8EZaxRdEZeRp99hjnaNma49DkN+0xy9OTV7UnLPSzEPEyGY+6C9lFPV6o
         eO6moh2yg4HWJBr+k60QcIUv7HgYjlPTuowB1d5t8vFZZsiTMoXETTL91dzBpiDS5kiN
         b1/8Gc8xDCW/H0QVldn/0h1RGi0UcbYA1b45tO15G//2QliIH/9GDpYrZSN/rufUVnvx
         VnuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=Nyxc9RELNxwvbQNlId86D14RFeMIcd9uCw7ztxDPM0o=;
        b=J0F6KZ1ORv/Dw7MxIHz6w2l5m6ovsYBOEXQG9xVKctS5li8n7yJRNf3CU9bl/pHtds
         J8xHMbEr4vZWFQ5ym1Thx6B7ShmcEcE3oSqc2DxugbhP+43/m9N8kt50YWtAcnnQTNL4
         UY1cNCKufYIf9ah3yKHltQYs7+gBOBH9bteKCF1oWWRiWj+0XgvKd7flQuxfdAghZoBr
         9vGsQ8909Nruu3nFZMhpnFc8BX/3o56+G5hT37DQtvk1mnmG8RAF1sAJLJADPVQiVYGh
         qcuhDbTKPV67t4wBttNJ+gVeYH4is+kFbEZHwoQOjj1m16NT8UCPhs4XKvF0+FK74LRV
         1yJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=cao3XyvI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyxc9RELNxwvbQNlId86D14RFeMIcd9uCw7ztxDPM0o=;
        b=Ql1M9Ndr2W2QQOlwmAd0aGfgj+4BRRptEkjTnzOT+oFYsCYfivbD6v5B0jf2D10Ju2
         AB0bzd3g1LGn4NG11r6zBfUEdEO7k6ieq/OXZyllGmy+lKlS6EN94G8AzmdHu4Qc006e
         CpiWftUElU34JHOKXD5iuxmQx5Akt2JaO3Cvm8hn6vvlOZCXY9sWxVRR5T1Xr1VElsIQ
         iX4CzIVhPijw1AlV74dyg8WPfGm2ul2mSKCVlrfJR/V7waZgxa8BsA2hyBOQcD2QoMig
         xdC/YH/s4k6zml9PZDTVBaHpQH2szSxW7UGxCKETmRU+7fDUy30nF1wDvvzXAOx6o3vU
         5XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nyxc9RELNxwvbQNlId86D14RFeMIcd9uCw7ztxDPM0o=;
        b=a9ndmoCL9GraiccNi9tDiICCpQCFjFWPdpDBTTw4ofgnSE0J4GksLpYQW3kqE1cAMY
         5+BmF/DDLIow1KTRhVNaN/YwoduovI47oFBDp4BpAD8nsyV8AThxieXv47TRp/C6IHRl
         7pb7yNfxF0LB67yEQ8k4AK/900/FygO8TzSUJkjoLlsk7NlhFMTOczKJn1tk5f4JCYte
         fB8PNlRWFx6uWBX8SQ+Zeoqhb0psGz7mvattLwyQGS2NHIH20hWtSQLmwmQuO50VkynF
         32xDhUF3UKsZBpPQXcqAm/y8hsNrpCCSfV14li/LliFypdYU4/LFTsqB+xoVbq8uK8AE
         9wcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pnZAs80gWBpzZUrSrhd3d+1nLD54IRJ7Vn/tYeWfEouFlyPFHhh
	H634Eoots13x39Eb8ijsDyY=
X-Google-Smtp-Source: AA0mqf7yY2EcD7JgFUAGX1Bw3tIpaXmlqzwZ5vKqc01p8Jwehv3Kys2FV2xa1wiDmNadiryp2TLPlQ==
X-Received: by 2002:a5d:6545:0:b0:242:4ce4:cbda with SMTP id z5-20020a5d6545000000b002424ce4cbdamr14466577wrv.534.1670938817912;
        Tue, 13 Dec 2022 05:40:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:540b:0:b0:3d1:cfa0:aeda with SMTP id i11-20020a1c540b000000b003d1cfa0aedals385748wmb.0.-pod-preprod-gmail;
 Tue, 13 Dec 2022 05:40:16 -0800 (PST)
X-Received: by 2002:a05:600c:6890:b0:3d1:d1a9:efde with SMTP id fn16-20020a05600c689000b003d1d1a9efdemr15335601wmb.12.1670938816234;
        Tue, 13 Dec 2022 05:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670938816; cv=none;
        d=google.com; s=arc-20160816;
        b=wIZpq2Ti5dSsqM5Nf0gbCixo5/MwMZgvMFykg3gEQZY8xl3mxa/hSbfyDo4S4agHjf
         VXNbfs6lE5ODiUB/flIDqKupw0ECQvDqFPt5UnvAgxRnc1Z3NgAocmpIZ0fAHFKgOcb/
         sBYrs3+jiq07X03b9yk3VuOzYCbTLZYyh2dNZvAMujkUc0Tx6DiHzVyLvBnL2mNv98KP
         LsPMPBjb5vKJcRVeDLlMHrxWbHjlv1k5RTwrZNM3DPRlN0pWrf2BlsufdwCp8bv5diak
         Bnlb9/bivsS5km23TR+x0baamhY9V+PU25VBUY0lk936M8MEnXYp/yRvmY6uW6bWEp0M
         +5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CtMLqtALlGvsspcvYpjOubygh7rf8vOAogXSxoTq1QU=;
        b=NhLxEr1wd4db7K60ixy0M1+ZiV9l2CbEz6lxhZnh/SxPzQpD/Kr+WOb90vTIep+dOT
         UO7ipAsd20Vfj54XVJXBMtfaXHNO0fuaPlyLuFo1698W6x6RunxkXhRyzAwK5SsvhS8V
         prbQ+jjTx7SDvqrH2F5BURP0wrdpOz1tS8dxYAgLYEimLB6ad3EnEBtKftTMwert+hjY
         diUOmumnAWpA8kVSlK6tTNYOVzS2HVhhvXo4flCpPeswYHm20tAeqHxtpVznpQJuTC7/
         WEGZPomoyx+jsXbRi2/Q8UYahQU7wiia+k56/x7GCm0SLle6ch5x1i3gkwCNbRXPA9Nd
         RnMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=cao3XyvI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id m65-20020a1ca344000000b003d1d8d3577dsi126446wme.2.2022.12.13.05.40.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 05:40:16 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NWfkl64l2zxwH;
	Tue, 13 Dec 2022 14:40:15 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 14:40:15 +0100
Message-ID: <03cd0b25-efbc-accc-5366-23b48cfa7021@oth-regensburg.de>
Date: Tue, 13 Dec 2022 14:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Jailhouse on TI AM5728 and 5.10 kernel
Content-Language: en-US
To: Jussi Pajala <jussi.pajala@iki.fi>, <jailhouse-dev@googlegroups.com>
References: <CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6eQ@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6eQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=cao3XyvI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Jussi,

On 13/12/2022 14:05, Jussi Pajala wrote:
> Hi,
>=20
> I'm currently running=C2=A0old jailhouse 0.8 on 4.9 kernel - provided by =
TI's=20
> SDK.
>=20
> Now, I need to upgrade to 5.10 kernel but TI has removed=C2=A0Jailhouse=
=20
> support from the=C2=A0newest SDK which contains the 5.10 kernel.
>=20
> The old Jailhouse doesn't compile under the new kernel. Also I saw some=
=20
> posts that the kernel requires some patches=C2=A0for the Jailhouse to wor=
k.
>=20
> So, what is actually needed? What are the steps to configure the 0.8=20
> Jailhouse to compile under 5.10 kernel?

I recommend to take the latest git version of Jailhouse. For the kernel,=20
you can use the patches on top of:

https://github.com/siemens/linux/tree/jailhouse-enabling/5.10

Thanks,
   Ralf

>=20
> BR,
>=20
> --Jussi
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/CAGN5k0hC7btZk2kwQhLd_VQE=
y3ZvdincJUphyNgeRKeyieT6eQ%40mail.gmail.com <https://groups.google.com/d/ms=
gid/jailhouse-dev/CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6eQ%40mai=
l.gmail.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/03cd0b25-efbc-accc-5366-23b48cfa7021%40oth-regensburg.de.
