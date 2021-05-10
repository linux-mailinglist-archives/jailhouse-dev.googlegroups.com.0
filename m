Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBK5A4WCAMGQEPVRQO6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id 22025379293
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 17:24:28 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id c11-20020a170906170bb02903bbefa04cd1sf1168041eje.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 08:24:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620660268; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sg0CkhbKPpSEFLZKSYzTvBmLHHg0JvlRrd/BNLX0S/LU0gichAqPp/6jUA169OotvV
         u+M/bgm1V9Mk9+ZQM6GFqctrEe1LMHHC0/naDnM9sbqQfH6qC/2cntJQ0alHCIDJ5Jpw
         isQo/LIskRyPlgf5yERpBHW5qat7BjBmHXLNaKNlBUiFNSbw2Ykw8ZU159jQWuGiuI9J
         6pF01pQs8GX+HiI1GWrtvr0wl48+dpN/PmBC7UklBem1Pzey0msLMagWpUwml88q+Uux
         ccRMl0UJeMIdyAf8RY0+oq2Gpaq8qQBYm8QOiIkFJqZHTCyELKS57IqqYI17uPpJOncb
         MN9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=MFhXVAYPKLcpwciFtMMrQt6FfjFhclpa3RCnmOIt75Q=;
        b=fcKw/RgWJlZWpRGaRYdUgO3AAhHs+I2Y58TYvqmbzTaH84TtvncyX3/tpuYvc4EQg9
         cnD0J6wKmiw656WXaIFbNtVuDVMK2HDjCFtsnZU/lJTiBhTSbM9UpNQ7ZM0m8tn+ZC+A
         KOVLx1kyL0RfbgcQuwgrQysbp7jseZV3rsrm+AYD2lu2Z05vO41hDeLk3wXfbGSW244Z
         JNZJAVIV4v/hr/Ks8czJM1LdpCYHayZAoXbY8K3Euo6wTG6XwJ7ovJHLM9zoaBkIRNGr
         ejQrwTxHyYyS/wzPQILe1WVXUrUmSVYc39jRerTckFv13oByRB24G1euayk2WLM/6QGT
         HdSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EHJ6oR5P;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MFhXVAYPKLcpwciFtMMrQt6FfjFhclpa3RCnmOIt75Q=;
        b=sxK7BaX4Uppj6kkd28r3Nw67xGbgLwxSQ361MwyhgLLybWGHA8w4+F/hRwKkd/UpwN
         eV6GlZ4FRz0U/tqIYWwknoZe/h1he3hK2onSVob9UPRNBwtsKVPD/rU+0pGvFDhu/h7J
         HctLJAqOFdhuEn3eB81MIhHJVunMLsBfuEh6Yy1cETubtt1tJOSDTBcvalkTlpxCA3/g
         gNV0Yp/W5+IjUY0vvQ7+cHud7iWZshuKIX+fzRo4u28B6J/KT1FMiOwCwlriDMsNh/nd
         hjBAKBIa3tmjLK22RrilId+BuDoP7moUEFEFC7SXWCDQKFVRFwkT+gMtX+FLpo1WRn7v
         Ndpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MFhXVAYPKLcpwciFtMMrQt6FfjFhclpa3RCnmOIt75Q=;
        b=SkYxKWDroKoI9sqj13IAanMcQ5PEchLTpQPkyLF0EaVNpS0fzbdiMvYsPeGxHn4ZYa
         r3yZ18HkZQM++ZgZH0NPERaAPz8XBLix+b5Iv1GNZK1xvHXECm0HJR2YFRbuh6EuRiPX
         kpKIan9LiKExQntDIafHzrJ62qAza3juzHrTZauQ4ek0SpmEmgMU1Fc2iCdt6Adgd8+M
         avgByCvf+x5/2bNmvpyLyPL1E1JQZ5X/vPBkbRQBWAjnDressi0ecrZazdWtFAwruyT4
         NA5x0YH2nzqMRKTiyMKGwzXXp+GQq5jivCqiLswZ6RNxpPMp9KkT/5VpJfH60Weyb8ID
         di3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531a7krIT7D0OXaRqM81yFIiWsxY2G1ladajuuKSHrmfkWZPGlFl
	SVjLtDAKHbFja1BoXu8J3iI=
X-Google-Smtp-Source: ABdhPJwIB4fJ/LF4TQ6BsoH8HTSIuJyDS8iJ7ZShypxkH0yYwE1KfE1i+0AaXzH+uI98sVfWddbxMw==
X-Received: by 2002:a17:907:1c15:: with SMTP id nc21mr26820317ejc.49.1620660267827;
        Mon, 10 May 2021 08:24:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fa90:: with SMTP id w16ls6925216edr.1.gmail; Mon, 10 May
 2021 08:24:26 -0700 (PDT)
X-Received: by 2002:a05:6402:2548:: with SMTP id l8mr30503503edb.208.1620660266809;
        Mon, 10 May 2021 08:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620660266; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFyt3J/6fBcFMd6DnxP0EzzVakr7BDsEVSlE0izVIAbSPd8tQodDdaLs3JtDwv2gOZ
         sy927yoG4f/HRBYSiATYfCW65Mf/SHQfuNu9vUdqRV7MjYnxGViLeXOQfTG3w8PLFWmN
         6QzuX6SamEz92nlsq3NsCTpzaNXgl+jiOdDNa4EQDX3G5vZtanHWd2Qr/wnpyuYDcVRh
         kGiV3LkbA5EROInq0PDa8rjPfMDTfOWPo2YfBEkvNuWHWURu5HURdgQG1FXk2/+stWig
         RmmcefeQ+U3h3EetXzv4zm+q4ucM9sN+3Ai2I4X8SFg4KNrTvcPVoSdosv6uUJOW1x3W
         7Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ZXrNiCwBaXWdOY/sC6JvfsyVjVmZkj48JAqM4SL/aic=;
        b=HyPFyaRExvU+OqSzQCp0JGo/t3//vKeVNzbttiKrl9os5sUyJ4bAF/KyNn3U1o5vdm
         w2LQvr1Mz6Ksa0lDdpW+rASh3fCFbQ3oDCmrJS17wC6BYca9R7UlkWlTy7Zgb4LULZ+B
         nVZqGGm7m2hd8XiKsjW//wRLb4TH8gYebLcl8aa8UsYj8Q6a9UeiOtc4Dx0u4H8N0kaJ
         3/xhnNPikv6MTvvuKGZG+l8JLKmq68t3NWqsLsYId+mUKGPGW6TfqBZhYE5CRNsF0VZM
         4GYFdVW3jCc5HRoCkuQSaf88qN9OpY3W+64o8F6p5Tue6qaRnIFV0lnyxo2BW8ViAYIn
         vH9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EHJ6oR5P;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id r21si1074271ejo.0.2021.05.10.08.24.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 08:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Ff4bZ2NGCzy0r;
	Mon, 10 May 2021 17:24:26 +0200 (CEST)
Received: from [192.168.179.73] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 17:24:26 +0200
Subject: Re: Windows on Jailhouse
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <AS8PR02MB666306E1B7F04C85B36BFC40B6549@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <7c85c613-eea3-4e5f-3bb4-7d1fdb7db826@oth-regensburg.de>
Date: Mon, 10 May 2021 17:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB666306E1B7F04C85B36BFC40B6549@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EHJ6oR5P;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Bram,

On 10/05/2021 16:19, Bram Hooimeijer wrote:
> Dear Jailhouse community,=20
>=20
> Is there anyone who has tried to get Windows running in a Jailhouse cell?
>=20
> Given that Windows is often used as HMI, it would be interesting to see w=
hether it would be possible to use it alongside Jailhouse.
>=20
> What are the fundamental limitations one would run into?

You MUST emulate every trap that Windows would cause, as you have no
chance to adjust Windows, as we can do it with Linux. And Windows
'expects' a certain defined environment to be present at boot, such as
ACPI / Bios / EFI. But we arrive in Jailhouse with in a void
environment. E.g., there's no regular hardware discovery available for
platform devices.

I could rather imagine to run Windows in the root-cell rather than in a
non-root cell. But that would require to port the driver to Windows and
is probably combined with a huge amount of pain. And who knows what
Windows is doing with your platform while it is running=E2=80=A6

Maybe there's a better chance with Windows for ARM, but I never looked
into that.

  Ralf

>=20
> Thanks,=20
>=20
> Best regards, Bram Hooimeijer
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7c85c613-eea3-4e5f-3bb4-7d1fdb7db826%40oth-regensburg.de.
