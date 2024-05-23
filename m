Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYWCXSZAMGQE435MHZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A608CD0C7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2024 12:58:44 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id ffacd0b85a97d-354f44ebfe7sf931881f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2024 03:58:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1716461924; cv=pass;
        d=google.com; s=arc-20160816;
        b=aN3Q8reYa/KT4FifKGg2zs4YEISSApgQilaES3rHHZdzqBKWfnZi+oUq5sQDcP0NuF
         iu5FEn2g45SOKrYrA5caQ3WEsJsybkp6V8fOr6Qj3A6+ZGkWGh+27HySamcre99sKrka
         FPxQh2yod2HRsGtJsSpnNFOX5HHAI/+vKbppzWMDIgBmxvLUPa+u6AmYL+p3koORx+aU
         aTspSZQWr9w2q/QNRZ3OF6usEmNCOK6BwO8+jh40y/U3gHljLpGDfg1u6K0e3hlUVyf6
         vDaUeq4VHutTR3uIJF8GTzhj1i8R5Kt4fgd4MRrSUB85povngY8gzFNQK147S/TcYR90
         +02g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=WHtD/JAIk8XCxtlhPW4BusEj/Zbk+q3NYtxOWHdn8ho=;
        fh=wd/5u7f2egPqYZ16IuulbESrZuBd9qAGlg73jrL0Bko=;
        b=kuHPZjgP6hOnKCd9chLDh22MPmVk1kApXGvIYihg49wU6vVeoCmW0DjX6iJyHFLIJJ
         Sb/zVEalcPP8wkEdeMlh2q8F5HoEOsekCqRE5iAJZlG+4TncA6fOErnmwo4SBYMcefjB
         pT2lFoL5NIXQVsRtXGFWzwyZS5Skirr3G3Zn/J46OepJ3BD2mmeayyYVDGjJtSJ/OJn8
         HfUpilDYnJkSab4W2xim2osr4806Y2rKtmpx/wXm5DGMPLDh3/JZAbfoC7vMbJ79GIZ2
         tzLr+nv/TEyRXn+xnzQTh42YX3ATZUgz3bfMZydY/yLHGXuMgC7mJZVRV63d63GfZkrH
         Ebog==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=KEyVWuFn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716461924; x=1717066724; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHtD/JAIk8XCxtlhPW4BusEj/Zbk+q3NYtxOWHdn8ho=;
        b=sE3D5ds2oKnuGaw6LIAzwz7hufD/jJCQQdyAbYRe1ZsmdHM2rttrWQeHXLGMX+DiW4
         6YMttWPiDOe1sjAd/XFVrYy/v6AQF/134MOuZsv/bPJgTCXixqEEVJHkKvaIMi8S+1mH
         2G9W8oF9G6xZkPHnS9YDJXK7Hbk0TzGBw/1EJGDZoeceATT+Hhq/HUv83+xuTNNhjQ0I
         qE+0h+wcWh9psJa+AIB6aDk2J7njtNmotGJP718ag7ggm4hQe4MNbCVcjxuKqclCTOQd
         qOX0XMfSBLQObM+zAL60LlIHtV5aXBNVrBtfbIRjYhDFB2x4CMQN+QsH6oO4U8fzLA/D
         Mlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716461924; x=1717066724;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHtD/JAIk8XCxtlhPW4BusEj/Zbk+q3NYtxOWHdn8ho=;
        b=OfRjDNnvAI5ZpjkrbRf3qYP0NT2HJ6vfXE5fd1Iq1e6V95zACDLZrTYlCGcvi2GZl9
         M/jai17aEVGiQ7w8app0Z2H7NVu6ZEhCu7n6IaJJXBpdWvQZb2HgMb7QbzAY61Vj4rGu
         FfPV08iZoOiduKvG8feKy9AK2lXx1uk0KxY6KTVJ2sVDj7FYlnBrJCcD7+PMzmQ4bQOG
         XR0OuXd9uFS9aHxWFe7GAXp+vOc6/9Ni/a91Z3ZMV2y0HBP2Vs7V2ukN3JqnsIOLXKVM
         NaA2nV8ygQbSrjLfk4WY37hoNwUDptuMeTMg2ctAfRjtAKszgqBdwreyOMIS8uA3L2wG
         sBYg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCUKiEqZ//gJghI5yeFhUJNarsZi2F6oRw9h7rK4EQXVLYPy/rAW34kDiVB8HkNCiiuk6ylXNY51SAukUvpueszCoTTe+xHPEbOZSkI=
X-Gm-Message-State: AOJu0YwNPufnjU2dTBl1tRfUawFoEnQ30Fo8gf+SKtXOfz4iaecXCfek
	F3KdleHihB5pTuL6jdP+XpwLNSS7K9c3gz3H3q2E31Una/dfXQaL
X-Google-Smtp-Source: AGHT+IEFZn6iu9eDx+btMyyxitD2YhJMpzisdN3BNoVv5oE35wKq9DyxPfEAwfx5E6bzDb5Ppbd86g==
X-Received: by 2002:a5d:5f8b:0:b0:354:e021:51ce with SMTP id ffacd0b85a97d-354e02152b5mr4052753f8f.12.1716461923561;
        Thu, 23 May 2024 03:58:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1e87:b0:354:f2a3:d59b with SMTP id
 ffacd0b85a97d-354f2a3d799ls443302f8f.2.-pod-prod-07-eu; Thu, 23 May 2024
 03:58:40 -0700 (PDT)
X-Received: by 2002:adf:f8c4:0:b0:354:c43b:6b31 with SMTP id ffacd0b85a97d-354d8d8bae9mr3190940f8f.51.1716461920598;
        Thu, 23 May 2024 03:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716461920; cv=none;
        d=google.com; s=arc-20160816;
        b=Fd+rYiZK7725bomhyanXEe7cpxJEiTkAYYGXzcvHSo+LPKIowUGOHqiko8tKkgmakS
         4XvJAX1S9+oXO8WwqSrQSiWzngge4Fo2AU54YdPl6/CmAOb3Ar1wVFq4OEJ5MOHjrkl2
         SgA9RcfPFXu6w7Yv9AJAm5LPzEJe4bkDkqBxlCYjAYd1ZCDr1uV1/D+JQlrGCEOHmAm5
         zP3i6FDC6ErlBIH9mG0vl4VbKHKE4qAQ4Q6QVkHd+MKFh2rOlZg0nsSFewDEvhOV2pOQ
         Zzp7B85GHDjLjkRi9lptH3z/q3UJftY1EMPG5gNlIQ57i11zCx+wB0U1nL3QDBfoaglc
         upig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xlYa0+AwD9wqwuKU8SJQMDcApMKTd8QKCNJQJwV/yR0=;
        fh=0KNrnX+9XWNItaHIAcg8EYrA/ds6ElBc4l2D4jIAUGs=;
        b=c+q6UJY1ZW3yXrA6sk9RHhR91Pcc06u5dXWNc6VpXP499M2hyuFZ7ZWt/ZidsUAXNd
         Z+ZgTpY3oLOyIlvItbl9AT0zhS8SoOBeyawVYCdcD+oZlcgxYFS7MT/crbb7L7Jx3rCO
         0YY9gPDylk4m4UdMeZMPlpIxK86bQxLi2Bbyj4pzEQUFkzijAgQwbXXTTmCrfRZWRAqO
         16nxsOzabWRH4krPVxE6X4dvT+gMxhoeQq6LR770G+pgcTQ7TI9O2TJn0hzupdhgUc5n
         LnT2qYEmPN9XkpI848DlOqr7e9nFti1KJcCrQeBF/jdLiVG0Z6/c3XfUFd+4w5kFJZjJ
         tZqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=KEyVWuFn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id ffacd0b85a97d-354e74750d4si69559f8f.6.2024.05.23.03.58.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 6E5FA3E018A;
	Thu, 23 May 2024 12:58:39 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4VlQC31Nj0zxr0;
	Thu, 23 May 2024 12:58:39 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 May
 2024 12:58:38 +0200
Message-ID: <af08ae11-7643-4ec4-9b9a-ed8c3e95ef62@oth-regensburg.de>
Date: Thu, 23 May 2024 12:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: Necessary change to fit mainline kernel.
To: Ke Li <cnnblike@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <98597217-94d8-484d-a8cc-d6be44452dd4n@googlegroups.com>
 <fbb5a1ef-f872-4a2a-9731-ca40866d84e8@oth-regensburg.de>
 <CA+8fi3v7n9P2i8HxhQRrFSbxV_0XFe9Uq4-H9yckc3g6iHXeyQ@mail.gmail.com>
 <3b5da0aa-3c1a-40ac-80c2-92f3becdeb94@oth-regensburg.de>
 <CA+8fi3v0zgPH-S9LdipmnAcGEvhtmLKWRL-My78vYktoYiZWMw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <CA+8fi3v0zgPH-S9LdipmnAcGEvhtmLKWRL-My78vYktoYiZWMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=KEyVWuFn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 23/05/2024 09:43, Ke Li wrote:
> Hi, Ralf,
> I've taken your advice and do the following:
> 1. Revert the change on JAILHOUSE_BASE to=C2=A00xffffc0200000. (btw, I go=
t=20
> the idea of modifying it from the talk "Tutorial: Bootstrapping the=20
> Partitioning Hypervisor Jailhouse"=20
> <https://www.youtube.com/watch?v=3D7fiJbwmhnRw=20
> <https://www.youtube.com/watch?v=3D7fiJbwmhnRw>> time stamp 1:28:31)

Outdated. Don't touch the code at the moment, just configuration.

> 2. Update the RootCellConfig and add whatever memory region I can find=20
> (except gic-v2). Info collected from below, the latest version can be=20
> found here:=20
> https://github.com/siemens/jailhouse/compare/master...cnnblike:jailhouse-=
rk:working-branch <https://github.com/siemens/jailhouse/compare/master...cn=
nblike:jailhouse-rk:working-branch>
>  =C2=A0 a. from RK3308 Technical Programming Manual p12-p13=20
> (https://dl.radxa.com/rockpis/docs/hw/datasheets/Rockchip%20RK3308TRM%20V=
1.1%20Part1-20180810.pdf <https://dl.radxa.com/rockpis/docs/hw/datasheets/R=
ockchip%20RK3308TRM%20V1.1%20Part1-20180810.pdf>)
>  =C2=A0 b. the live dts I pulled from a working armbian kernel (you can f=
ind=20
> it from=20
> https://gist.github.com/cnnblike/f758596d59899f4d300eefb55ef5f81e=20
> <https://gist.github.com/cnnblike/f758596d59899f4d300eefb55ef5f81e>)

Please no links, just simple attachments in the future. It's horrible to=20
clock-navigate through github to get what i need: raw content.

>  =C2=A0 c. the iomem result:=20
> https://gist.github.com/cnnblike/eb6ba4ce958d058edb0b7ae4ddd124e5=20
> <https://gist.github.com/cnnblike/eb6ba4ce958d058edb0b7ae4ddd124e5>

Alright, just a short analysis: Jailhouse reservation is placed=20
correctly. iomem confirms the reservation. Hypervisor base addresses in=20
the configuration are correct. So there's nothing odd here.

> 3. I have also done multiple experiments on my side, all leading to "no=
=20
> output" result except the following that may help in troubleshooting:
>  =C2=A0 a. I changed the cpus section from 0b1111 to 0b0111, thinking may=
be=20
> one leftover core could at least allow the kernel to have a chance to=20
> emit something for=C2=A0diagnosis. It turns out it DID emit something wit=
h=20
> one core left:=20

Nonono, don't do that! Jailhouse needs all CPUs. That won't work!

> https://gist.github.com/cnnblike/34dd8d241846c8b8cf43f01cc4124dcf=20
> <https://gist.github.com/cnnblike/34dd8d241846c8b8cf43f01cc4124dcf>
>  =C2=A0 b. map the peripheral memory region as a whole=20
> (0xff000000~0xfffdffff, sram configed same as ram) to physic address, no=
=20
> output.
>  =C2=A0 c. same as b but without gic, no output.

GIC seems to be configured correctly.

> With so many experiment, I'm wondering, if it could be some other reason=
=20
> behind such weird freeze kernel result.

So the thing is, no matter what mistakes in the memory region you might=20
have in your configuration, you should at least see a Hello world from=20
the hypervisor on the UART. That's the first thing we need to get=20
running. The rest is something for later.

So why doesn't the UART work?

You already confirmed, that echoing to /dev/ttysomething on that line=20
works, right? Are you *absolutely* sure that you use the right uart=20
line? Please attach output of dmesg.

Anyway, base address and size of the UART are fine... In another=20
project, some time ago, I also had some issue with the designware UARTs=20
(8250_dw). There, it was the Fifo Control Register for some reason.=20
Let's try that. And let's print a early 'X' to see if we get here.

Could you please try the patch below?


   Ralf



diff --git a/hypervisor/uart-8250.c b/hypervisor/uart-8250.c
index e6112820..7b29af0e 100644
--- a/hypervisor/uart-8250.c
+++ b/hypervisor/uart-8250.c
@@ -19,6 +19,7 @@
  #define UART_TX                        0x0
  #define UART_DLL               0x0
  #define UART_DLM               0x1
+#define UART_FCR               0x2
  #define UART_LCR               0x3
  #define  UART_LCR_8N1          0x03
  #define  UART_LCR_DLAB         0x80
@@ -54,6 +55,10 @@ static void uart_init(struct uart_chip *chip)
                 chip->reg_in =3D reg_in_mmio8;
         }

+       chip->reg_out(chip, UART_FCR, 0);
+       chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
+       chip->reg_out(chip, UART_TX, 'X');
+
         /* only initialise if divider is not zero */
         if (!chip->debug_console->divider)
                 return;

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/af08ae11-7643-4ec4-9b9a-ed8c3e95ef62%40oth-regensburg.de.
