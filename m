Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDMJULYAKGQEMZGAFYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E99D12C23C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 11:48:46 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id n24sf5236392lfe.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Dec 2019 02:48:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577616525; cv=pass;
        d=google.com; s=arc-20160816;
        b=BE0ln9+bJCQm93aIVczQjSB1Z8HrkUhKBmRnTyyVyJUilKtRPOkd1tvaymJBc7+aQu
         umb+xKHCcU8Udw9jQa5EdrLCyV4xiUg+q8rZnJVxxxJpWTQ9L7SSxxEmsxPmnklXMvd7
         tScm7qLi7EEOnEJWdPWAQrRor4EC1Xl42pfGvvRxjZgI190nqVxiie74S3PkYF9usetX
         9PUfW2HUaeMoEug4Ys2pUUWLscfHGfj3JA8ZqdeXvNerLL2l8Yyl4GbjoB0vIXKixfrl
         liaTbagrRmfdkytS0laOXOMPFzazXcCB4fO3GeJXx2XWQm4PAVGw1PfXcAIzqLothEPS
         KB5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YryhRK00eflbDSx5+GlY4N1GsYOEfg6d/U9ksc/Ar10=;
        b=dd15fQbkJpMDY3P02A5gLwXahoTmvZbHaRibliKe8cmyiSyvABqVoiOOjjKg2ZhDTd
         9zUMPF+i/ISQzrTm6CpR9reIfpCOXSHkXjhZyLH6TPaSjGkOvz/ixZPRd1qOXtmlxa2W
         YdmWwL1Cfl18jVt3yob84Po+ZPC/D5XLNhIZVSXtTaes+t4k5NVl1xcR/Rga8M2Zom7x
         YXGvosWJxTENIZegp+ZgUCLttxrmm2VmPdeIQV1TMssOw7PDA8zFIVrq5vEb0AksoXN/
         6rxit2xuXiiDBGQJs0h1UKsf1Wa2Wj3lBpuiQVmoYyQ9zjtE8kMw4YhV87K6uBlamiUu
         Jnnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ecN6drSR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YryhRK00eflbDSx5+GlY4N1GsYOEfg6d/U9ksc/Ar10=;
        b=gwr0KwD6Ygjw0KREfYRf7EvrMXWSXreNPBkVXvGALJV3B0kkzV+o9mvBvkQiC36Z/V
         BxniyW9z+WANP556ANLgXCMeHku2szi3Py+/ZGYVS1cxAztils5aC7W3cfhIRFZ+wrW4
         teGlv1fBhk7PlrlWniq0Jl8ZzchSRntm4raINb/FaJaMoQzxGf6g3LVKEEcZrCQBUxap
         p4yrSaD9Y8ncvVxyb8jdXgvm/T+9hNnSjEJYr/wYtbSNaH4jQMNwELSln1KhJqYJHWsg
         nPK153wwONVn2FVEUYQd2X2X9S7/bN3r4Wc90+eHP9qvl3e3t52/E3ko4/DSvgeVAE/L
         ZvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YryhRK00eflbDSx5+GlY4N1GsYOEfg6d/U9ksc/Ar10=;
        b=bVEP7PCzpaLVBoUDqf5bwzZnhyejnK4+bdfmZjXwhpbc/blH2EipQ2Wny50rNJnyFZ
         6ZGtip57v+zebVgpl681lNV6wSHkuyKZkabf4XwT8ciVqOR+oZ2CfHmqEZu/k/CoZKaK
         GGaVNWaixONgUvISv5l1zXJsh8Yu1N11NooB9xi2qvfzShAo3QL18bMgByFS03o9vAqy
         fTqVN7VbwfYWWIy8Z04ln8gftspt+/QbZjszVFKTBIysxBx8irhkON1XKBVGrXCWF5WC
         2jsnn3Hjhgq/aUbZDkcnA9xDccV0JSxXULE0dbKDo16+YhIb7HnRSsfQ6ii+NKU5qy2/
         jfYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVjUUo+95kmkpx6s0aCYLVF1c9PR/nAOsm4GRwo3zfYxoVa5WAg
	1ovMYMiF+FFgeZlQ5d8yAcw=
X-Google-Smtp-Source: APXvYqzuU0rKzo4TKg0dmkgixmbfrzixAGf8Phe8sXmubR17OCT4y+DWaFYa8MkROFHgnF6xp2mdaw==
X-Received: by 2002:a2e:9cc:: with SMTP id 195mr32566804ljj.130.1577616525585;
        Sun, 29 Dec 2019 02:48:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:44c8:: with SMTP id d8ls2731277lfm.10.gmail; Sun, 29 Dec
 2019 02:48:45 -0800 (PST)
X-Received: by 2002:ac2:430d:: with SMTP id l13mr36766907lfh.112.1577616524991;
        Sun, 29 Dec 2019 02:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577616524; cv=none;
        d=google.com; s=arc-20160816;
        b=W9Jz3wq9ffMyRdQi4MA1MGQKIOYbnFOMFcHMKnmy+fHDuEbC2Fnn4clgN5C+adECSn
         gc7enl21Hk/wL/zN47CY5jWelr8Jcw2AR7CTM/woyHJeBqdeNteYK7IPLegxmZ5ayijI
         zAnTh572QVGsz3SDzy3IA3PM7grt1kZ5EceiyYZiX8PomfdJ1O6X8wgmk0l8wH5KWpry
         s6F4AhOLz008+zwqwO/VY4Cr/UTZChJWKNU9W2NQuU/67QBuRzvRhcZkaeGZfzGguY38
         UR+eH+q0O0bT430yV30t6j9exxyQH8rkosGDnzSqEz0fodTwZsHGlaMtHmayrRz6yxqx
         rfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=RAPQ3Ez0RXsUZp04BZ60SPvGPW13z5m+bwU3FCof6pg=;
        b=z2D9QkcuVTTy5ecsSUf6EH8LnqOr2iqbEn1ZxemKTAyiCVg/mnQr048naiMNxurmuO
         2HzBP/J58Rh8VgbgOS6JRgrrsYSseV4SbZK2vETDAw1LqFdz5dL3kWBu+El0P4jmWeyI
         4Vd7p+jstSvf9TezOgWHXRfxGjMxOzqrcgETcPyfOrhDTr7r+b369yv+F9K33a6XOVcv
         RhVtxNiIu/ubm7X6SkiSprwWdUSUDdPmsoIgmeDxlACwXraTtZPZxah+7RlHydoWsAIN
         0aZuWY9xGBkPAUdBnQYhTOxZhWc8zPoDHXBYId8GhHL9rP1pNC9IzlrAGaFmQVBrj0k5
         RWCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ecN6drSR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id c3si762589ljd.1.2019.12.29.02.48.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Dec 2019 02:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MJTYJ-1ik9bs2I7X-0036cR; Sun, 29
 Dec 2019 11:48:43 +0100
Subject: Re: [jailhouse-images] qemu examples stalls to enable with -EIO
To: contact.thorsten@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <c6d8a14f-97c4-43f8-828d-679b08e14555@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <4d491b38-28d8-a0ea-4cb1-1499957997bd@web.de>
Date: Sun, 29 Dec 2019 11:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c6d8a14f-97c4-43f8-828d-679b08e14555@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n6JbQHRIBLYhy/ZH5S9BI9P4yHqX0As72QWMWumheRw3tmEoiEa
 KE3ePy6L28nztQ/hN1tHYvrsnLTnrNOwoBg0uQEAofRJiCbsyxLhsJ0NervE+gEYF3jDv8T
 eWebrJlNhhbmXQLWgqeTVsec3dkUSazNyJs9pwcZUCeWPWEmQTnDf9O3a+XigcNeYx1Ssbh
 Gov3HCm1DEpwEBEWD5w3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XZ3XU1kpUH0=:Ut6is1uMRf56Y0ezvzxQeS
 0OxSTuvITNC/d/gNa7wBfS4n+OImykjs8k+fciW5w1jScm/spNOK4fzsYRUDxUC8mdVeEit60
 4TsVr2wsUKXaqpFbm0y5PJj7xDaZIEIavnUNAVaOGUj1SnQ895OvVuRXKY1J5Tq69F0FXJz3p
 dkAtMMKz0ogale8V1lNQa9+N8mCbaDv4Jn9DA3w/0UX9HofXsaulTrkr5DaP6/XppbyaFpVWi
 vMPEUnfwYtZmM6ihwz4z95xiz1B5Av8cFMvrnR7TxNTmPoVa47V2/X5iZri8ebR3OxK1bakGe
 HyiEUyYscp9eKJMHIoFXCwbciBqEAZw4aFyXZ6GXSQfiLfvSFIpirfopSkzTbSKmMh/hNIruG
 1htwWow/BZnBMgMdjyMqtWCVHRwYpDtqi9FwVLsIew4Mb0DDNPUTfaGOXsZuzF/qorchSs2EV
 3iY6fBoHvpeLUN3kdIdbeJ37QTeYQt/LdrSGAMkkiHAZ3ko/BcXd5eLsrPOVTYQTpmCSy9VDE
 g0u49RYam8pkQpT7Z8Rh3mMioVmKxbsZNmBHJthq2TIbKimwvvWVJbV0NgzZXoEG4vl4yVGv9
 lzut9MFqzyci6fhuY3ZPuFPfLvUueQTCV9Q9g5oFDiswv5Kq1H9bTQ+hbRahcCNKCu2ID3DvT
 unTvn9H8JUsPtpdW8F/vy3UJPdA87pliVlAd/qo4XCOPhE6BN0iZEZAFCDCie1epL+PJc95Jx
 XNzGx4nvtqJPmzErsQlqrLyjC1oz6KRpToEytssRNpKv1XnOs0ySqB0UTG92GJox5DPM/Ok6E
 rLVw5sg7Z2i3x0S9COYcuMPj5poNRp0UCrInD6G8xOlz2LbR60usSnjIpy20gZDgwHe70l7qL
 wag3VRnGszAvqbf6HXC5gorBf4GEeCLEZBYDAdTbbpcogTIRU2NIUSy/6xSbDP0yOQSEa96v4
 wBHuVQrHLhzG0cV+LXWmjroLDKgfqhY6ooTtenvm2E0BhLE575zBAgsR/ZBvQNBAfzj8eOq+s
 vme/SdaMvWnecwn4ouvZsqwGPvB/KZ8eNbCc0w7ViA3W4/6Bb/KlY1KDPPWHum/3hWx8F0Y9Z
 wrL9pgEMvTveB/ok1nhdB6vyb+0LjMqBnDdqx5Soni3WgGsOBC3r1y3y9nY3SJMMo+LnDjGIf
 Mu3TBr0cUJJenbjggOYSHdub+7W2c0Ca1kF31/ixauW7YZdGOvixDmI3pfObLg6xbm4PeluCw
 tju4/6iBgjYH05J7D+urquGOwMqi4l8ej5nLWxZZyWZOAFTQEF3Ka4I1FI+k=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ecN6drSR;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.12.19 21:42, contact.thorsten@gmail.com wrote:
> Hej Jailhouse community,
>
> after struggling waaay too long to get the really well prepared example
> from Jan working, I just want to post my intermediate work-around.
>
> So, I am on a stock sid-Debian machine run by an Intel Core i5-6200U CPU
> (X260 Thinkpad). The preparation all went well, however hitting
> jailhouse enable ...qemu-x86.cell
> JAILHOUSE_ENABLE: Input/output error
>
> tracking it down (after creating
> echo "#define CONFIG_TRACE_ERROR=C2=A0=C2=A0 1" >
> ./build/tmp/work/jailhouse-demo-amd64/jailhouse-jailhouse/0.11-r0/git/inc=
lude/jailhouse/config.h
> ), as it was recommended in the FAQ,
> I found that I ran into an odd feature mismatch at vmx.c:247, namely
> CPUID and read_msr(MSR_IA32_VMX_PROCBASED_CTLS2) had different opinions
> on the availability (0x101008) and usability (0x0378FF) of the XSAVES
> feature. No idea what it is related to, e.g. processor short coming or
> in use by the host-Linux (4.19.67-2+deb10u2), or ?? ...
>
> However, "easy" fix was to disable the feature in ./start-qemu.sh by
> adding "-xsaves" to the line of "-cpu " features for qemu (QEMU emulator
> version 4.2.0 (Debian 1:4.2-1)).

Are you using jailhouse-images master, ie. -cpu host,...? Or was this
-cpu kvm64?

This may still be a limitation of the host CPU. Could you try "jailhouse
hardware check" with this patch on the host?

diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-chec=
k
index 37e02b7d..375816e2 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -221,6 +221,10 @@ if cpu_vendor =3D=3D 'GenuineIntel':
     check_feature('  RDTSCP', procbased2 & (1 << 3),
                   'rdtscp' not in cpu_features)
     check_feature('  Unrestricted guest', procbased2 & (1 << 7))
+    check_feature('  INVPCID', procbased2 & (1 << 12),
+                  'invpcid' not in cpu_features)
+    check_feature('  XSAVES', procbased2 & (1 << 20),
+                  'xsaves' not in cpu_features)

     check_feature('  EPT', procbased2 & (1 << 1))
     ept_cap =3D msr.read(MSR.IA32_VMX_EPT_VPID_CAP)

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4d491b38-28d8-a0ea-4cb1-1499957997bd%40web.de.
