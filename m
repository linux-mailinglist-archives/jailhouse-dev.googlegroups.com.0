Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXSYT5AKGQEJXCGKWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F925C8EB
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 20:43:03 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id d8sf1260551lji.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 11:43:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599158583; cv=pass;
        d=google.com; s=arc-20160816;
        b=dhSy8ZUzQjl+5vD9fzOchfm/fwG4uwGLZQvII7oQiotjlSNB9QUHyGd+Kzkmvl5MN3
         96sbUXq0n2qxUCa5rGLfyDHsojuP97rb1PtW8Va+8nTVu+gWAFhwTTgIml1zQCEe5OUm
         KhWrTZi6xunx8qP6tzkyQ/XkC2K6WTCDdhPGacyLy2i4orvrkY1NJEjXqgqpQqv8XjX4
         qN/pbSSd6ONievQvm1cnVWxTx91j5hkNN2FKFMQ9yKYKfa1CmoIEeE7StvN4W6c7/lXr
         Uu4GyHkqQW5yTKuQTODCvPnBEwqnO7K1sFSDWh6H2QrUOZScvZXnVjW21Q+naMswX3E3
         0WqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ltPmn/s5isTCcEzkfXNnT2cnIFJXPrWeaC2OfVYOp6M=;
        b=M3vd9tQfkVS8pXzRhyW6cPaf8cIaa0hp86KAkw39rbVPexkNWteOkozuZMRa55tflq
         Tv/Mk8yYJ6nkM0ERsyY/wJV4fVuxjGUXTEqU83RKbbEN44NjmduyBvg1hE2eLDI5Mfi2
         ktVy+3j3UGNCpbER09KujCQBtsOeCXWL1x35IPMaxQwwvbwwFJxZpcA56VhsF68WU2yi
         cJa7obIYL4RM3OTvhd8K8Zla1AeV9a2UTKZolz3VJ7axg/lBAOol5e8yd1hUCqp2G8cj
         QOdcqee+SE5W5fBG7YDV/MQRkEJ83GULBlRWnw4/Q4VYEKwrYIKh8jTMDyQXqMFG+h5S
         iGqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ltPmn/s5isTCcEzkfXNnT2cnIFJXPrWeaC2OfVYOp6M=;
        b=svzkmmnC5qefys5mLfLt4Ybs+Ar0Kkg1zaF52KQHs2YhNZAW27E9i6/5x8DgJoKNtg
         KwS4TfIJnTTSyt3TcKTvrwXdu4MDA3Nt/2RMnk4oPkyklRCyCSOQibyTYa2/PWB5F35R
         XX7LgB7ciObstMw8UkEqOPf6Oxssgmir1HLgb8BDqKZpTRKvOQ4U/RxIJbwPvL4VwMVb
         BlkAGoT2O5P8B3oeFmrPv2bHWAahNi8D4bwg3ekcWraA1o7Z2cpToGGKsRbwctWTnubf
         KmV077P1sr7wzXlnB63LPob51RvLSYt8MjDC1NL4OctbPQ2hCX1kD8QI+KefJH8oYEUm
         qqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ltPmn/s5isTCcEzkfXNnT2cnIFJXPrWeaC2OfVYOp6M=;
        b=K8JVtM8Mt58uf6aaRGfMlWQHvbSpc4Ls+DUdaEJ1e6q64O0ek+l249UUKp0BsW/h1E
         CN1kWGy8VYuYj85pSGIkfvEdRWYsIQXnld4D6AMQQIFxa7tC4+d0X2LKqPiaLIvCY7WP
         noJjDsd9cLd1de7bZwzHz3DdDLOinZ2x+sM+VG/2zVHoeZRxGqzqOeQiCJcScp5Gy1PJ
         3E/hlL/NZAJVGcwcEKUlcnLGCbpOO05jF2YcKGicNX8GMn+uH8Pttiit9IC/b70XRW13
         ZHCQvqIpYzla5fJ57l+AVrmos3f4fIrV4KkBYtvE8HEuMaXFCbtOL07joCSEt6g+JChl
         rDqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530YQ3RcpuEu0mtDJj/EEPwWdlyKtrYxgSrSGw/r6wP3juz7h+X/
	znLOP/K6GqQ0JFWj+gRESjc=
X-Google-Smtp-Source: ABdhPJzfewlVqNzENvNFQ+MhaV9utyNJdYEa1aa3hRx0W6x35jeUxPzhD3NSc7DxFUBBYoIDI57oVA==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr1818209ljj.461.1599158583151;
        Thu, 03 Sep 2020 11:43:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2c01:: with SMTP id s1ls276523ljs.10.gmail; Thu, 03 Sep
 2020 11:43:02 -0700 (PDT)
X-Received: by 2002:a2e:505b:: with SMTP id v27mr2096657ljd.224.1599158582261;
        Thu, 03 Sep 2020 11:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599158582; cv=none;
        d=google.com; s=arc-20160816;
        b=tC0e/Ht/khUJwOZLn3JGY8IbDPccpoW3pTemJea8y7Xs4ZPnBo4r2hfPQxEibTWw/T
         Jzj3T8qrIrr2S9gpzQh3aEzhLxotFizj269S7RWWgK+d3pme/NNMiHSSA6BVRzMfmN8y
         u6raDIlqSBHKIwcB4oFtRBQRa5gzmVTbAosr0ZG5RrH2pxFjJFagJg3TMYOxIPzFpumZ
         3OS3PIVXskdArW2rEgVKk/td0/U3G0jrfNnjM1Os1LPss927wXKDnO6gvWRxt2ZmiSX+
         tVMoBOHbh2pXfKW43Mh7aVJyn1HffpW9R1M9RN8FI+rh+5n0MGvgOc4giCyH5QMIVLMu
         J1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=HuhZGzkwnmAnuCjOH349hLnvz5QZyUDHJ2rE0Enz0Jg=;
        b=bq0KEeYMhARSbUi1il7nQEhi4bmVzK7Y0TJ88LYW1RpbhIzb9HvLnHZv33RL+v0UUk
         f8l4h+dA+Iy2MXdgXK38YEY5cTVdToZq92dZpkHgZpyHkI8zezS4JtS/1C2/zRBEAZ/J
         oLeC2Pm7LXv3u0g6bIhdbpwv4P4kTosNteBXqb3dNyJQX13Ldpq6oZ0n2YZqi5slWanC
         p55LXh8J0OQLy6F921RsMEzjQOwbL8MwyMujr1AdDzl+XAWVB8LeSbmrYJNCeoGSuMCb
         0cYP9QXCIF7e/AsBzzTsRrQ/y5AnI5zZssu1UCMHBk4IdkcZQILisyqT9+5mY3u1zox4
         EO6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k10si135103ljj.0.2020.09.03.11.43.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 11:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 083Ih1qf002605
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2020 20:43:01 +0200
Received: from [167.87.132.24] ([167.87.132.24])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 083IgwJT011220;
	Thu, 3 Sep 2020 20:42:59 +0200
Subject: Re: imx8: could load 2nd linux in console but not getting how to get
 the shell up in display screen
To: "vsun...@gmail.com" <vsuneja63@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Peng Fan <peng.fan@nxp.com>
References: <15b9588b-971c-4664-94ec-42479be2d871n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <16956cd9-31dd-14c6-7314-d42505dfb9e1@siemens.com>
Date: Thu, 3 Sep 2020 20:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <15b9588b-971c-4664-94ec-42479be2d871n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 03.09.20 18:23, vsun...@gmail.com wrote:
> Hi,
>=20
> I could load custom image in emmc & that boot up successfully via
> jailhouse non-root cell in console. Root cell image shell getting
> displayed on hdmi but not getting how to display 2nd linux shell on
> imx8mq evk as "imx8mq-evk-inmate.dtb" doesn't have mipi_dsi port for
> OLED. mipi_dsi port is there in "fsl-imx8mq-evk-dcss-rm67191.dtb" only.
> imx8mq has 1 hdmi & 1 mipi_dsi display port only. How to achieve this or
> any other way for display? =C2=A0
>=20

Peng can possibly answer if splitting the display outputs between cells
is doable at all. I suspect the answer is "no" as both might be driven
by the same, un-partitionable GPU?

Jan

--
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/16956cd9-31dd-14c6-7314-d42505dfb9e1%40siemens.com.
