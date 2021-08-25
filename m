Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBSXETCEQMGQEO2I5I4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 599003F74C4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 14:06:35 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id q9-20020a2e9689000000b001b964fa10b3sf8788852lji.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Aug 2021 05:06:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629893195; cv=pass;
        d=google.com; s=arc-20160816;
        b=FJk1GPfmTEgruk30rlSCG6fTuzerd2hvPvkEjWZrg9+a5QTTxuSf88aPN3zM5s4Jrh
         7X2jFxlM6qToYnpXuiIeG1x2+naw9dN0xzom5CDv0xagRgiZ8nzFQEiVh2/qR9Fg7rMK
         TXR+GKWmUh8JZGbDS28WbC2f5hFHJ7+KazbmV9fvBgFwGXb1nwKCQgLj8id0eYSAHmbh
         wUP52RzX0CuIL/c58ocqccOidU1D+drole5LsrIJk51VoKtbc7iebQWEa8Z8OTUd4qXI
         YopK8BSn6Q61PwoNZkJptC3ewBxMQyY7SCyUOG7FbdwWB1SRDKay6PoG+coioZt97X5E
         tuqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=URrdvLw5wdiGfYRCnXJ7ZmBommxLObeLfExTJxNthRs=;
        b=bqJstNdZncRLDRqmxSKl6gPO/H3cgYyCEue6iydrwoNn/YBVHzBYzK+xDlw/vNh5mr
         JyQjBOaBPjLgUEgsQdcq+l1prWEOogXo9zLJRGBuNedD7bvC/zI2XkAgAlUPX0ng0U6R
         gDPZeSs6K/HpVqzcIxMUCerPsoqlQPJRtdCsc4gBf2nUmzsRKbamb+g/8GhV7covFgAu
         gqHzqhRdCL4CFrfK89gAD07pOLd4vfdIMEPuqGXRUNRH8Mqfp2biRR9wnKX0O4N1iOMf
         o2tksiKcg3eqMrWQo6lzpBtj3ueUYa4PwU0miPeE60Z76a5EhSnZPGh40XrVJ6VNFZAs
         r/Wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AhBQjtXF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=URrdvLw5wdiGfYRCnXJ7ZmBommxLObeLfExTJxNthRs=;
        b=FsnLwEEK54r70e5stcqW4T5TzYeBR9BQ539VXDY1ZKIO1hNMjg/wNsrlvgSeXUcr6B
         zZ5qAnyo+OR1L5YvziokYGxgZ8UHLdDJl52js/5b+YnNCO2pg+DGYhF2wFUvWZM6okWx
         oQfIGcJgBfFs++frM5bQ1jtlqWi7NSpPrNSstStQoqj1MI6CzMqeTvq/mWZAKvNrVT55
         f8u8lvLKuCehpjb278B6G+kEErkdF1WZ8daAcophSDAa/pnoKkyDmTEIFBjXnd8wVs+a
         Qxb3DhWgubexoOiJrFg+Ds47Ezwcpi5W0pGB7bcfwmm4C9EgF/zLTTfaNyrAPFz3MPNo
         jbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=URrdvLw5wdiGfYRCnXJ7ZmBommxLObeLfExTJxNthRs=;
        b=KcQMD/BdFtQ32oAnmhKqwOlrdfobRQYg6VWD+ovYFT4Jyn+JsEQTA7sVuHfGUDdCmc
         W6kENFer66kANZFekwE8esuCNtUACF4LZysRmMbJWTSMYoD5R9VPRIdAlHs/jQUcP1dW
         G1EWWkCB4majfh0k1xBNjYsGEjJmsOsKlUNI+2qY9D2Igex5U0jTH2XeyATPW1uHv4vT
         7uk5O9st0F0Sb116HcMLob8G2vG6GMDEGPrk7t55gWlsjzl8Fc6Rjrty3lPx6S3lBX/8
         JOqz6/HUBwhI9XDh9UQcvZKgdapE9PgVDk3QpQ1IlEtGaGHvBeUWzlHr0QEyzz+4D8Nf
         QFNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SjkJSvAlUKRPpUSPoP0mL3kgfIHjCJbfJdWhxLZe5D+V558Ii
	i27BTMGGBsVdScnbfo6z1mA=
X-Google-Smtp-Source: ABdhPJz/X2HTZ18jH0adHx48U16y1gBND1vL1vMNmA10h3BFYVf6FFxIQOZ65m5cgTU8Do5BdPUx3A==
X-Received: by 2002:a2e:8954:: with SMTP id b20mr28162164ljk.146.1629893194821;
        Wed, 25 Aug 2021 05:06:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8652:: with SMTP id i18ls365588ljj.1.gmail; Wed, 25 Aug
 2021 05:06:33 -0700 (PDT)
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr35702572ljj.83.1629893193411;
        Wed, 25 Aug 2021 05:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629893193; cv=none;
        d=google.com; s=arc-20160816;
        b=vf10YQJH7ttUfqbtzwqR8x1e4l0xiHOzmVVFftPeOMin6DMpyihh0v10znw5tLQ4FX
         9LLPmDL+VwL/V3WeGUUIwQ3ZQ5DDYw+fALTUnXa2Sx+92P66CGcnNZCPrcRIUr5dKPvU
         D+3+JaDEChgxkMb8eZWesBlsSQuTH6hccQnDEXSaXGp04Cr1jGBM+Ed9fuvR6gkqi8zl
         IEz7PbJGaj+oliPyDPMDE8jh0MXBAC65/GS8kmYvBfy596Gt5d0TARcVtiT6e0pKnkZN
         SFWQNnZPTzXOXWYvQoOPTiNohuSComPkBQ8rpK0Sf26R08LVKQ/nN35bzCEgGmU3uick
         lfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=IyY4312FxLQEWVpjyKAQQPeQSSgq/b3vFiL97mtJ+hg=;
        b=JFS14ven6xJLBZ47Lx0S3fgbN3FVU0+Z5bIpfCZOsNXtHQETsNS2rglK4A5oq9e6IY
         qvJ4uQpK33y7vhvOqEgp7n2I+Q4UlzLgKdm4WNMjS+sMbxBA86a6TA9k7lxN5GIT657B
         0LAJq32hSka/L49XgkaxEY7CeD11H8TGP2cPUxlzLOh829XoXNhcMVnqJzrf0derli7/
         /0YzFK2X6AD4/RPlDpRv4JaZycWZLyDQ/MmG8sm2ddJsXpoRQKjGuELzI1r8OYCfdEIM
         BKjMZKw6bhU/QzzPgoYyOYXbBugnCIV0FAwG1G0J/vmde8I1HiQNr2RW1HA7GiycdBSM
         /akg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AhBQjtXF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id h11si1427185lfc.4.2021.08.25.05.06.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Aug 2021 05:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Gvl7q2PJ2zyjq;
	Wed, 25 Aug 2021 14:06:31 +0200 (CEST)
Received: from [172.16.2.139] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 25 Aug
 2021 14:06:31 +0200
Subject: Re: Building a Baremetal OS for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
 <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
 <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
 <e69d0408-a3db-7f6f-75db-681719a44391@oth-regensburg.de>
 <e81df823-0997-4dc4-85f7-8fb3632d9d57n@googlegroups.com>
 <185ddd7b-09f2-422f-ab16-309ab34c0ee1n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <52eaa77d-6f8a-ff52-2ac2-cebdad3298a8@oth-regensburg.de>
Date: Wed, 25 Aug 2021 14:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <185ddd7b-09f2-422f-ab16-309ab34c0ee1n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AhBQjtXF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Moustafa,

On 25/08/2021 11:12, Moustafa Nofal wrote:
> Hi Ralf,
> Thanks for the instructions and your patience, you can find my patch

No worries, I'm on vacation. :)

> down here:
> https://github.com/mustafa13e09940/jailhouse_rpi4.git

There's a .tar.xz inside the git repository. Unzipping it gives me a=E2=80=
=A6
dirty Jailhouse git repository(??).

Simply use your tools: Fork Jailhouse, Commit your custom changes to
git, push it, and give me the reference. I can then even leave you some
comments on github. Please get used to the workflow -- sorry, but I'm
not able to explain everything from scratch.

>=20
> All changes are in /inmates/lib/include/BSP_BCM2711.h and BCM_OS.h, I
> also edited gic-demo.c but everything is commented.

Anyway, I had a look at it. AFAICT, everything compiles fine. The file
you referenced to was probably inmates/lib/arm64/OS_Scheduler.S, right?

This assembler source isn't referenced in any Makefile, so I don't know
what to do with it.

  Ralf

> Moustafa Noufale
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/185ddd7b-09f2-422f-ab16-3=
09ab34c0ee1n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/185ddd7b-09f2-422f-ab16-=
309ab34c0ee1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/52eaa77d-6f8a-ff52-2ac2-cebdad3298a8%40oth-regensburg.de.
