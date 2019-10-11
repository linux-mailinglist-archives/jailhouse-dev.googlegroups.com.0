Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBJURQPWQKGQE6CE2GNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E44D4780
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 20:23:34 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id z17sf4725409wru.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Oct 2019 11:23:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570818214; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zj59a/ap3ZFomjWvzW9pyiqh+UgaEOz8qKm6hofRq41LTWzDxL49EgMKpEQ1AXa5e7
         cscpsm6uKjNBhN73EDssNzxW/b9qNR/pgwEZ9HJqwlujYDJzj/C0SNOWgqRfL16OXuJI
         RTJEpUJNTnfIJDDNeFhs0u2vT2cNN099TQz9dyUXqMJmhnujYOO0pmwf7TE75hs5f7Hb
         fRRkMNWwDy7eAe/Sqx8NoDp84IKKJ67KegGagSxAhr8nkPhLaRTXF5Gb6/0ElapVlqHy
         8wRhyVFAJOTJB3icU1NIs/zoEo6Ti/VDvT617OTaCpIBlgbVNCQadqSJiXKwTPvYjlt8
         tdBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=Uc4z5gNq5uBWhoabqMoqb1BMJoeDZs5qu5uvrzQX4pY=;
        b=RLaN4qukl+WYCBUk0dzSPIquKgCs3/tW6ANTlLQ3bMoLtLkP+X8kEg+zfdyhn8WsUm
         DE/0lOK9OcxOn4YLpje3nLkXXhaUBpkKFYY1ebZDAFrOO2JYynMf8/Bs1ucoHIaBrRge
         WDPlDRaSxA3n8j+aaeyH17kr/ymD+Qn6CCW5bwQj/KVOQylfHlxmdoBEKNipbI+2naxT
         Y3jhb09aLyJv7g1UCf1aK3iZroP1khQqeDgYlfoHCmGve7Ty1n3VwZmuAvC0oBO34nc7
         wrigzXEM35fxfILhkGwqcY3AnjG3mq9ZdyrCLdcdcX09VV12r4GCr+HLmTmwCOJq9HRx
         jNfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=ZVA9n+Ui;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uc4z5gNq5uBWhoabqMoqb1BMJoeDZs5qu5uvrzQX4pY=;
        b=JeTkwXy+aNrg6E6flKNTkFaMe9rniZj3xixmup3TJU5KtkHquRbiMNp9uJnZzOCbpr
         4gko4jfoNVADQfe5GY+D0H1m/Pt7c0pRTGSkIf9oPCebVuSl7ZG98M6GAyiHmUZp8PEi
         gpWrMQIARF0M9SYRnVVADpoIo9Z3KPIVwaKY7aPOqFCFsIOfrxaqsd3DlHVh1f8sORmC
         csbjTxw+pFkRStKgiPgwngHL7dXUNwD9qpCyjJxDbkrZMqfc+SdHjJyUypjtK82pZmBl
         HlNmA2CisNqGcPgt1DSjxaMSP1RpVXWqBbyoEbz2aohKBiPLf4BMoni6bS3MvW5hkZRf
         KjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Uc4z5gNq5uBWhoabqMoqb1BMJoeDZs5qu5uvrzQX4pY=;
        b=GeInqiXKCvK3c78q+E/yIE41m2qlt0jC8AmLddU2pqxcnwEH7HsVfrcoLRxGOWa0uJ
         A91IxqplLAkt6DKbhQtWPcKNdI5HcpA7R0VFVxwIscN36+4HmS524FWU5g0zAeCOHh8o
         sxcgnocKfPMksxEa1NoiynMIKJEwXrWY7EAYypfLfmqaEMBG7DLhhrI1n5yxSZbtI3AL
         jsEZ/dizKkj7Nf+8dJ1gCFgZvi/uq9OZ7R6xbH23w015Zk7ASr3kpxXw9q688pGsghY4
         M1kH5pRJAkNL26pcHW1ROXvxQMTtZLHkbGk7IAhi50i1Y8PoFPYTf+UGLfbpWZaicRWp
         2nRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVKE6IC+UF6SQ3paYTBld5NVjp5qAf9QmgaoKJtVrVPgzLlOoVS
	pCQh6FVn+Eg8Z7UfP27JluU=
X-Google-Smtp-Source: APXvYqzsUELWhAdvHcfr27CtX9f/uo6BnsdeTMmZbYg0IEEz+Q+2pXaWyOjvZW0L/vBowM0JKwIFAA==
X-Received: by 2002:adf:df05:: with SMTP id y5mr11542788wrl.84.1570818214420;
        Fri, 11 Oct 2019 11:23:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7304:: with SMTP id d4ls3167168wmb.0.canary-gmail; Fri,
 11 Oct 2019 11:23:33 -0700 (PDT)
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr4437637wma.7.1570818213629;
        Fri, 11 Oct 2019 11:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570818213; cv=none;
        d=google.com; s=arc-20160816;
        b=aLswNW+VXFJN523VwM90AJc6N8YhKnD9H4sJG5mq2CczffWs2tSRRo5LGukiT8TjvW
         vdDIc/og+XKIQIJ2oS2VdRNu8jV59wnifa9mJhv5RDWhpQjwQ3LBgApUiLCDJwr5gBqD
         mIeb6Rpkt+o4qpqxptHAn5TbhFz7E/mh9QbITIAr3BoVZI5/dDTcHmPmwmhdr6wataFG
         kTibgDgw1SoWzQ3X+t2DeDyUcv2AIi327gvDipCmeuWQAVV9xVGTml4Z34bvDhbC86Eu
         e4+tpQ3fX93d9h9SA1x6WnCQDkQuxfApmhyfJYb24c0wVFlhVpztyteo6aDch4PYVWYu
         OhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=+nX26Z/dXDptOqKwZFewvpbGjhmSR1PYbbnf43QleqU=;
        b=0eVySPYqU62t1qeelp1kHd2UwzJo/ahi09ReBZ65K8vNYoOj4hTUAAZ6gteAkpc9kH
         o1njlOkay3rHHP8U7QI8rSQY2ivH5CctcIKNTEtidDQslehPm5D4z4/QgV9Br1D10EjI
         pN5ifpHzltL0PY/Qq92KYgLTcGTNvNjpVshXmALWTO75COcm23aVVlsY7SeIuR1z7iyX
         CDfW8dZzwZk+aVXeOIOaOHZ53I1bgJ2ocGks2UySm9Aj4olOuM7JmwKXE6uwirngoV0b
         iDVSVnB3AavtyB2UwQJ1Bbx8NdrYeRctvnv06AWrMyKTNWlb15Y8T8rxqr2I0IprI1nm
         QCVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=ZVA9n+Ui;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id a133si879406wma.4.2019.10.11.11.23.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 11:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1hdMI00kav-00kjkQ; Fri, 11
 Oct 2019 20:23:33 +0200
Received: from olivers-mini.fritz.box (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 9B43B20289B0;
	Fri, 11 Oct 2019 20:23:32 +0200 (CEST)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
Date: Fri, 11 Oct 2019 20:23:32 +0200
Cc: jailhouse-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
 <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Provags-ID: V03:K1:ySAZcUediScKJTT4HzA/bBFUTnD0tB/1eYt75AC2nEahNCU3Kv+
 +siRtK619vPVq3iIIQgCG9l8CwQKWeOKlSVFJ4LSkVBDNVuQRIlH6+Ozu1Zj0TveZwOCFJA
 ptccS/cnDWUS+J6OHSjTb/GPCdBfu4jhnRIxoKPKnrV1I53RMGEGGEEEZhuantZs/H155Yv
 o4beC7qeOiP91P3ZZIjZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JSDy3YWBo/M=:kxCq59HaNgiOA+XayZaS+Z
 I4CPnMKwxW0CX0mKPv0YV9nKn6RHv5YWIOdvzlqUhgkYjtCiu0pBY3C/Ce2ziXLkk+WfKHjro
 SI7nQ/3rQv5SXTSB8sesjTRLbM/fe308ns8kdL5EIBphZSbMSaZboTufixnAXjd4+fxavwJNW
 QF7TyBnsAe1cB/oSf1zOTjgOwVDHR0rgu4n8gpd08gB1IgE2kfPYlG8s+OQHWDVV8TJhCzCdd
 7XaYffVG8hI5CHM4UVEKvRMzPeDNZnailIE9unVM2N926PH+6Eg23Z9dMc43485a5PDht3H7e
 PGDOG104POzuGnBtMfQvmYvIEntlJabrDuX/ZJXQnctjpC5UpIlvebc6KROoj3UGIfFvHQJKr
 px+QPvz0CEnI4budyoSUMZSakN2zOfTGUppeQA3DNei+zOLkNcWxZoxpiWuVF0fObjznYj+3j
 jUr38h0XyGpuIVbAYKkWSImo7GSdVfRz+jI5TXoSWuwmiDqgstpCHWI62VwXHEyhvj/3qfkVp
 vWzEsA3bU2pLXl0NLgqDm7rz3X/MOsnBu0zQTnXjE6wO5Ncxrr6j1KniNCBn+1WAuFkEUic7D
 C5rtU32Vr/wMbxsOz2HzAhGhDSjurAO3HAtga7V9CNuSDKX+w8/nOsSAB4fiBTYrCV55om/L3
 zgjfSFPNI0w+HeIz0YEfPO9pPYec4byzhKoY0zq3uwTCXa/E2ocuComBIssoivcfYLTQ/LCzg
 Z2O53qm9tdLBqsAYTs11ZhzdCMICs2Dq4UQW7Ks2Qy+u6D553Wp1lp7sB42NBvA6axxI6T6O/
 fi7Xm5nXlYQfl9Zb9Htgxyed5mCKfVf72IF1rp/YGBeSdz2CACYRRE9dQ2dS4QwVElu2COtv6
 M5/30Ud3gZUvsmlyGXvW8bPeE0ZI9/fXqYxHKLkGBk6qABhO48zoU1BsEkAdHXza415wzgsdl
 V2lObGXrBR3uXQmzOQRDa3zVjjNKpUbAFxftYlI5lRtTkFjiI93lblFH2eXNEWGPWqpPUQk66
 q7aqgA58Ug7xMIOlvJ1Hcn9CcLhy/JVON79fKXaEIM8GlOUKG2O66ctT1J374njY5dx9+BQjN
 3Rv4GPsT8i8NF321E01f/tJ07JiGfEXwWNT13yacaYfv4hP1cGCkSoM8rM4hXWr8BPyWWBYea
 dA6KziMyYSGCeGnqQBDmDWZxJqminB8oixTAATdd31c4kxRnjWot5O3TR+f2qaDQXfFaDDdYZ
 KXJ5lgYHXkSIR4apz4qc4Ey3kXh8Ie5PO7cl2/+8Nft7cL9LQiEqytuvFzPc=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=ZVA9n+Ui;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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



> Am 11.10.2019 um 16:31 schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>=20
> On 11.10.19 15:30, Oliver Schwartz wrote:
>> This patch adds the SMC SiP IDs that are used by Petalinux to the root c=
ell
>> of zynqmp-zcu102.c. The SiP calls are:
>> 0x0f: PM_SET_REQUIREMENT
>> 0x24: PM_CLOCK_ENABLE
>> 0x25: PM_CLOCK_DISABLE
>=20
> I suspect that this punches pretty large holes into the isolation. Don't =
we rather need filtering on /which/ clocks a guest is allowed to control? R=
ather than allowing to power /all/ clocks or none?

Maybe. I haven=E2=80=99t bothered yet, because in my case it=E2=80=99s only=
 the root cell that is allowed to issue SMC calls. I agree that security-wi=
se it=E2=80=99s more desirable to also filter by clock IDs. On the other ha=
nd it makes the configuration considerably more difficult, because you need=
 to synchronize devices in DTS and jailhouse configuration.=20

So you=E2=80=99d make both the call ID and the clock ID a configuration par=
ameter?

Oliver



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/A5DDA02F-7F4C-48F3-B28C-C31009AE8297%40gmx.de.
