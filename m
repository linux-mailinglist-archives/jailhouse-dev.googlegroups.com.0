Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKEAZLUQKGQEXUK2ZSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 412796ED5D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Jul 2019 04:44:57 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id c18sf7357444lji.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jul 2019 19:44:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563590696; cv=pass;
        d=google.com; s=arc-20160816;
        b=JpGEPKf14szHYxWsEi7qoH0azk8xds1eeoWTmbY0WK3q5Nwm4ZFTZ2SCVeWmPNm+Mg
         +IsI0WscJpYCHwjdLLSAtAeR89O3iW9IFm7GYdPoWaES09twGZGuy8igpm3sZSXpUzv7
         Q0PvTjQU7a5Y5uXXfMK9XqaiF/kHI/NIplM7n7PEbDHhOb+Jk2PYr6Z3/abgqtrWvSL8
         +C2pIg2BDSReKPeMy2WnXTccf2MCYWgppOrk/Y4Q3jWR4szs24acJgEoQQHxcyjU55Yz
         9+CLWveCfHt5lV4nwMjTFr42Yni3DUWBZQh4gB316oXPyN/qtXJQCX4NrVTWEfemOCoy
         f8eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=24Oagf7hW7XK9/yLR3X03SO3Mp8DWunpBfzDuZMyRIg=;
        b=kbl6xbdk4nK6gMFBw+aDdDdHOgacbIBQ/4X2L7VjlRiS1tXoHwUYZcy32+Y+fKVOlR
         Zh9iq4r+9TpCsd57Pa2e0COauAtG2p3+hix4V/Fph9qSOFQZnzJpsuZGnSULsj3CM8LT
         WVYqWNe8iCgcvohq4baPq+nK0HVGtarriLvdszghV9lBjq76ZU2gGoSjqVztPfVi+zBo
         uqzm+9jPUpFEt/QPUQjNW0o2063oLioxJ00nNX7D0lepj579NcgJWgHmb/DEAn5PnGLr
         6qPyT5s7jiRMXRpwlcSpk6gaZAEKNh3tF9teUKsjtaU8OcfwvjNIZ4Pdz9DNZ+rRC2Nf
         gp0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Rp1DVPGU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24Oagf7hW7XK9/yLR3X03SO3Mp8DWunpBfzDuZMyRIg=;
        b=Z4Up74Z3OIOGDcQwNYJYuKyPdRkVQGaUDMGsUvzElOb4rvcAWThTf9JrtHhDsFoZ3n
         nKM8E1x7fam+ckWmDHVU6dOskkdz5GQiLEQvLjX7lRS+9Rnt81mA3vJZOf1Tl/pMjX5t
         Pkha8DNYeqXz5bDKLTJKPLORgOngEu9mHjHwaySxpJ7IiFtajaQpjE+PhdQjywBfrKQk
         e5HQjMvECws5EebR+IS4SA7o0bXVIBOCuzWop+LrHVGng4SBGgBU6objvKrnNEA3wdcT
         hUpktc5E019BZL519t/VlJbwz6aeqLrcC3ur6OCNrpvB08tyafZv4oCuFT2OsHLOHyGr
         be3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24Oagf7hW7XK9/yLR3X03SO3Mp8DWunpBfzDuZMyRIg=;
        b=Ui1cK0r42KQOdqFpyw5WAtb97RlgqCcmE0MVq/jB3WcQPwzM2ZJiXDqMs45ziwYsjj
         JtcVLetLzhOj4NxIhiqx/BMhrkqdc/pggZ57nwVN0d6VZ9czztupWPWt8Mln6cR0U4Yv
         7BC0BaqsI7VgyPjO6PQhkLT+6D5cx7SxIl+o/K8UcjLe0/IhJVt7T7a/boAjdjlNTw3U
         9kExGb/mDdOM6h1jZkw9F+y0OVg22/p0ftfcPv8Yekh7CL3aZrgAwEhBiZSaYYHy5Oub
         oVs+/8G0H5ifRmOQd5nEgim4gZ6j/Rrg8pXzeO5okk0LpXbOVykM7lvGFl/hnw1gleAg
         e42A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWeXGnFHYn4FR2woxb7kJzygBTq+PkhQ8Cniz7G6gJ5EHWq3LXj
	lw6nt2cFq7Q2hdRiwn4MmG4=
X-Google-Smtp-Source: APXvYqyX4X/Vtu39uYcf50xLYvIaa90wciHIh2MyL7tmYznkuXwRqQlTEJjhmcTTfETMPFfuxU/NNw==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr28518934ljh.158.1563590696740;
        Fri, 19 Jul 2019 19:44:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls3883509lji.12.gmail; Fri, 19
 Jul 2019 19:44:55 -0700 (PDT)
X-Received: by 2002:a2e:980e:: with SMTP id a14mr29494430ljj.60.1563590695726;
        Fri, 19 Jul 2019 19:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563590695; cv=none;
        d=google.com; s=arc-20160816;
        b=jzRRPdtYRFrBxp768+3TO6a3axpMxGYOiFFxWrTr4dopHPFkL/a19/u25rxz41qFY4
         L6FKi3lWmzBb+jslGRNCBc0dlwikKDkyWAe/MS8YIX9jEc4sqjYfP3x+M691wtLBbYms
         59tN/4v0tJNwSDGwkxvZYJZm9KkQJRlAGdLARxDXHas0WgHlLD1HjTtuQ1eNMTDWPmxs
         21Aj+aaffOZeed0980ZgZe+7cKc2m2gtA+/fGLPDeUstCLUdL9F/kVIjVBNKCsJFO+3N
         SWWu08HV9RdqCLPTxP+Fmcj4OVxSbI1JG72GrLy0b1aBEV35ewHcXRnyXkfSDMgKTnM0
         7VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=1JTxNtaRwMZRunTPEe7PsGg12H2G/tQCkkaT1ZTM03Q=;
        b=glgicyaDNP4Ry0LwZ39hAsye/JKotJPLqdgA43CffA2R9A8om6WGjHtpsi3TAupjxQ
         Q5WXP73S+rZw55PgSxO36gKvJi2sXdLN8zxTBjUm4cRTEtDN/7G/XprhCLwPfa3k2qCH
         gv4W9sPbg5rczXyCxmr166Y0u7zu9DvHPsK/JuUn8xUDVPnsowxaJ9BRZyQrwtgQBWRZ
         pDBuN69vbRufV5JMG/0u1oIMtwaZC8ymGbbH674kQuMaJ/gL+JOv6FHb3P23JJVtSEZa
         Dvsi4kjL2Cb8O7KymNj++PCKvQnlrtqlaeJUHiTorI16jeWs4somx/7cREtc6e5v3RaD
         6WRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Rp1DVPGU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id q11si1605960ljg.2.2019.07.19.19.44.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 19:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.216.96.244] ([210.161.158.139]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MINAx-1hrhu63nMF-004Ecl; Sat, 20
 Jul 2019 04:44:54 +0200
Subject: Re: PL interrupt in UltraZed
To: Alejandro Largacha <alexlargacha@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
 <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
 <e10f5a45-4913-4b28-b896-0ac6b381e183@googlegroups.com>
 <47b00372-adcd-da18-8553-d7085bc6e049@siemens.com>
 <1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <d4ba7f75-12df-829b-c740-f3e5f55b609c@web.de>
Date: Sat, 20 Jul 2019 11:44:49 +0900
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4phfLNyMu2hDQvvcpdW842/0/X6NS9PGPCKD9DArdYbweJgtRNM
 ap0nVz9ryULfwIj7VM5HhMeY+GryOjPsiQM9L+Ed08oS3yBv9IxqVAbC0Lvn3T47xRGHJcv
 P8OqmhWTowqmTMm0QsnwjIjEWRhNsSYZdCpwuUnOuqzfLFCVFbCMa9kz5XcH+pH3+p539pF
 TLKpnYddwIHMmcGV9Rt1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LCqwMiNQlpk=:dpRv8gXZRsMJ0l6TroaGWv
 TZRDKsEeUlw+Q+Ow4uMoK2qSZABB4kP/Yv17TILBYFPv1bAgDPHYYT2SgbcMEckU8EReGNzTt
 kMvItZoEGDrMEsqwpbxH9KbtfOAdWuAvHctgSmUXCULQll8sm5DPge2fwh/lGflx9AnG5m97W
 TR2g5ztzGH3RfilwqRpUzvmJgiLMfKFPAKgbOplu2nQbsCTGC7Y2S93PRPuA4x8p/FF4cz8lm
 BCCQdYEq/ffz8pLGVm1QgYuSgK9LqsFel7BQbch1MTytveEPq1jlnZsZAc3AxfJiraoAE/aWq
 AAk+HjJuxR/slILZ5u1aHU/mQbhBctQTIVCxgR9lItn4T2VAM5kpAhvK/GMBr2g47yc9o9dF9
 zoXvLBCzuRWlJ7Ii8FOV5tulJDfevSR80XqpTE9TaGUW0oUmMb5ZagEodK0JQg2/V9Vqtw0OZ
 5fvby2GejXmU81RzEJw79xIUeGpEcMF2qsYaaLDQ07jm7hgPbjhsPwTjjCk5hLnVC0Yy5gg5j
 1SZ1Yz0j2wsVgGEH2rlmtgvDlWddvjjl8U3ZCyVUdJdhPAUiQTubz4gQuQDJKCj7lkPAwe/CL
 JngHKZuuJIagnNYK66jl6EJx3VNsw8JyMoXA+niFw5mqqcVc/Gfh0SFDo1Jq6oVpwLA+6wY+E
 k/pOzsPsRRIlgSC0SWxTULZdJ2HmlheraCqYf3Mnt/7P45OnbHhuePigoTX6JWXld6bftZvqR
 56Ca3MtJLUCdl1WiyVsL1Ed9goj5ANrzLzxETFkJI67KYUI0+VgGNUsTfwB1s5KFNOhgZeJRi
 GPnmla+/vbIJk90BfZVpE67wAJvdxN9DRRRonlm6vRlkySySp/j6u0G3OESooQ26xdGh0fMQ0
 hRInF6afWZXg5BxdpQfPMyWWT5qoyw0FZev8N2EMMaY319zn2CgOBPZ1F5ouW/lJDQ5HWYrgT
 Rq19Lxt6jhDzA7BfYK+b5Q/iTk6QMxRISDvx3tlL8xLWT56PaQy8QKLK3QFo3cxIG/bNb89fl
 iQItWebWFQABWQ4O2fPF4v/QOmo4b7d3tUXuxpnb2vgXtGveWhAEgKOGsFNBhcvgJDXAbhZTR
 RXecxZyJHMK5w6lS+vbQICfc3qPANczLWk+
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Rp1DVPGU;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 20.07.19 00:58, Alejandro Largacha wrote:
> I just tried and did not work. I don't know what I'm missing
> I attach the config and the demo code
>

Config looks good, but your inmate should crash when issuing the first mmio
accesses because you didn't map them into the inmate address space. Try add=
ing

map_range(GPIO_SWITCH_BASE_ADDRESS, 0x2000, MAP_UNCACHED);

before the first access.

Jan

> El viernes, 19 de julio de 2019, 7:08:41 (UTC+2), Jan Kiszka escribi=C3=
=B3:
>
>     On 19.07.19 01:32, Alejandro Largacha wrote:
>     > Hello,
>     >
>     > Thank you very much for the reply. I tried adding the irqchip entry=
 to the
>     cell config but no success. I have a doubt about the pin_bitmap entry=
. Is it
>     divided in 4 groups of 32 bits? Then, how should be the entry like fo=
r the
>     irq num 136. Like this?
>     >
>     > .irqchips =3D {
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GIC */ {
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.address =3D=
 0xf9010000,
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pin_base =
=3D 32,
>
>     This means bit 0 in the first word of pin_bitmap encodes GIC interrup=
t 32.
>     Then,
>     when that bit is set, permission is granted.
>
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pin_bitmap =
=3D {
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 << (54 - 32),
>
>     So this one grants access to GIC int 54 - not sure if you need that.
>
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 << (136 - 128)
>
>     And this permits access to int 136 because this 4th word controls int=
errupts
>     128-159.
>
>     Did you already try out the config?
>
>     Jan
>
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>     > =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >
>     >
>     > I attach my new cell config file.
>     >
>     > El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56 (UTC+2), Jan Kiszka=
 =C2=A0escribi=C3=B3:
>     >> On 10.07.19 06:57, Alejandro Largacha wrote:
>     >>> Hello,
>     >>>
>     >>> I have been paying with jailhouse in a UltraZed SoM with AES-ZU-I=
OCC-G
>     carrier
>     >>> card from avnet.
>     >>> So far, I have been able to enable the root cell, create a aremet=
al cell
>     where I
>     >>> was able to load the baremetal
>     >>> examples like gic-demo and a custom one where I was able to turn =
on some
>     leds
>     >>> via axi gpio in PL side.
>     >>>
>     >>> Now I'm trying to run an example where I can catch the interrupt =
from an
>     axi
>     >>> gpio in PL and I am not able to do that.
>     >>> I'm using PL to PS interrupts in my design and the signal is bein=
g
>     generated. I
>     >>> also tested with Xilinx SDK.
>     >>> I tried with PS to PL group 0 and group 1. Irq numbers 121 and 13=
6 and no
>     >>> success. I don't know what I'm missing.
>     >>> I attach the cells and the demo source.
>     >>>
>     >>
>     >> Your baremetal cell config is not permitting the cell access to th=
e GIC
>     >> interrupt 136 you are using. Replicate the irqchip entry and creat=
e bitmask
>     >> where only bit 136 - 32 (32 is the base) is set. See also other ex=
amples
>     >> in-tree, including those for the zcu102 or the ultra96. Both grant=
 their
>     >> non-root linux cells access to certain interrupts.
>     >>
>     >> Jan
>     >>
>     >> --
>     >> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     >> Corporate Competence Center Embedded Linux
>     >
>
>     --
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-b=
bbd9dafc9b8%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-=
bbbd9dafc9b8%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d4ba7f75-12df-829b-c740-f3e5f55b609c%40web.de.
