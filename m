Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ5XSLWQKGQEK7S7K5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F63D66C0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:01:08 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id l3sf7332035wmf.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:01:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571068867; cv=pass;
        d=google.com; s=arc-20160816;
        b=N07Uzr/O2a93IgJRBuAaJN7Iz5TR9HkDxJcV+0TON5aJ3JjTGBynsDMS3F1QnBygUr
         q+40pHRiz1QDThnwEu9ovM6IwJNCRHfVqU1Ofhk/e5Ulx8G0RLIEHB0QUmvGo0YZzkvS
         yvq+7F4+7RRziyz+nBQIVG/iCUYffvE1EfAuLH1XjZSZ9+YLu3vfiLGuCq+9Fh+CXPIx
         aCqTFSSaOFF0VACTpshtGy73ClWJEa0Ekm0smm9GM4X994AHszV0xUvS+/LXVyVXj2/u
         dfVDprGBPdRvfMpxCJ8Mbzf41cCRuaLwWTBJ8VNZLRAGWUrpRXMp7Zhb2an4Apdhu4Ju
         kjyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=H/QwvkKr/zAti2W0/WTShDrWNYBWzM84IfkvMN+c6/I=;
        b=ypZu+8I5ye2dYXOaJcwk5jGEpkbelvwDZejeKFCyqYVrsVoExGT41Dyv4mc9VU4hAO
         DB1JQQdymTE+Fkz0VoaBF8cfVnvKpkIIsU4LwmfLT6TU0DZDacskSK1ttORg+dU1GE/O
         t4U1HS7MW/bwgpICFQ6+EfHAMomlwMP/xwfIyaFzNJ7cg6xCT+8SmyzrTCjv4gEeLxK8
         6xv6SGMsP3E2OIN6NuJl3h8gCHqGJTB+indl0URIs4MsXBl9JWoHs9K+Kw8gi9gO9LNp
         KRuJbQBQq4vGY+SuIPvagsTn+9AfG9sFMR1I6O7a4W2LBjU13nSMdcU402/Ep6K7ujjD
         Z3KQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H/QwvkKr/zAti2W0/WTShDrWNYBWzM84IfkvMN+c6/I=;
        b=Q0/sgj9ghn6xxcSThRWe/H8STA72iB/x1XOE4IQwtU3N36isRuNn0pulBCITEk3StJ
         vVmNjewZ2WNoHD2LKX9mGAcpkR6YbL3xCbNO6a3BC0Zg69V7sMl1jnKODpnR1rQT5pLx
         ysYNAC9iPo1C8IoLztRqXsFqRpkStY0fASOuJh2+LqnqzI/TuDDUnrLQ8uW8V527s5Tz
         SzHrh44w4MD8MWFmTJwR9TMR2HXw+3LaMBGBWomDXxrPcsPh6lv1OYE1xe3ZYFv0lhP6
         UnHeXZrICYRnDfKxU3nrNxG2dx64xWjl8ZmVKNZ7Xhp+vbgHoQ1hQBIzKVfWw4GiH4Rj
         MgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H/QwvkKr/zAti2W0/WTShDrWNYBWzM84IfkvMN+c6/I=;
        b=E4ja/NTImY4+C4RAMoR4CgfXZNvxoLmEXvwtyEHx0UkXZjMisrqr+44ATWs9h7Wajt
         lbhCZRXxk4jEcW7FSH9n7aNEgZmY0nfnLAQO+1n0LmGGVZii9CLfpM2Q1RRY7g0jtWgh
         YDC40DMNhlbzaYNXdgsn6Vzcd5aHc8RCv64JKxI6WISgg9PVGs86LT8CRWNzfeSRUi2v
         V5NBOIdnoO5frNWHCmVhKTwG9m1zWHN6wUiIh35jlak54mpdISGynqvd9XxHyXSwog9d
         taDjKOv6RoHv7WJjpu5XThPGwuEVEkXvBCjbACQtWLiWr1R/Mp8TNCm/0Rle6d6dOMtl
         96Ew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlCB/+ejZQH2V+8sKgG+Qvevd+iNNmoGoINOxFBn2whA871jdn
	n4e+lfPrKp2JcNyvRjmfBIs=
X-Google-Smtp-Source: APXvYqz1MIUslmK6BmG+SwcTAWzSPcY/KltYfWEobFAoDZ3KMlNIw4uNBvm2NaFWpxhfo8FE689BFg==
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr16321302wmf.142.1571068867716;
        Mon, 14 Oct 2019 09:01:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9d8c:: with SMTP id p12ls5630035wre.1.gmail; Mon, 14 Oct
 2019 09:01:06 -0700 (PDT)
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr27264058wrn.233.1571068866791;
        Mon, 14 Oct 2019 09:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571068866; cv=none;
        d=google.com; s=arc-20160816;
        b=lIDeThcGBXsglLgnggVR+pVn9+2oxhihJWm02ehGq/C2h4wRvv1NcNADNIeZN0Jl3V
         bHxWnvvtNmxfhu6FllK/GK7y3/HKQk3YrqlgtFiWKoCS14Y8nitdDdmE8+93KJEhMaTM
         9WqDSWGN+gvS9/cDkiBcZTeEhxbwAvqo0kcleUoYDiYau9CBasEvQQR2Y/YFHcIYHmLX
         TtCopr9Wn2lpmMUQzOgE5uKxk9dXMRVxf3hceZa/+Pai0IDhXjDn7O6+R19x3MmeJVrU
         NnrTvYl0y8abVvX/55X+et8CYCKAf/X5l5eBytK/We97wdwMGQnBy1CO0DbfvD1YdYkE
         uIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=X8RQGN8mO+YSK+oRfj9bAx/fWf/NnUNabm4cjVxTQ5k=;
        b=AOKtGTxy5+07YLyGgBr8GkpTb+6YBbfoDYW+HHoB6BdO5q0NocbxhQflyCXNs/67ES
         1oaASCt8JmaU9lHUOIxnq5PFmddHufl+bFOtwMsOY+I2jXjNwWOZ89qJ+jUBXSgUaKOr
         3Ui4suPc60zmzOo4vq70XRaA1qQFNQXOv4SMlmgnJJHeNyfHzq7K6h1TZ6jR3QaCoGox
         3R3W161L9zTOR6Vg+Vx36K2JF60TeOLThf8ZisR+MZarfwpnB/XV5SmfGR8OLOhS9rJR
         Ta0BYrKa9cddn11ca+QEVIRPuz4q55tIK/DClZ5niQ3nMMfxfp4MjypQxQC0zxSX+fJX
         VODA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o10si1510825wrm.5.2019.10.14.09.01.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x9EG16dn012177
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2019 18:01:06 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9EG15dG003027;
	Mon, 14 Oct 2019 18:01:05 +0200
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
 <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
Date: Mon, 14 Oct 2019 18:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 14.10.19 16:31, Vitaly Andrianov wrote:
> Jan and Ralf,
>=20
> A while back I tried unmodified hypervisor by just adding
> am572x-evm.cell config.
> Basically everything worked except cell destroy. I repeated this
> experiment today.
> When I issued the cell destroy command I got:
>=20
> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
> [=C2=A0 187.112795] CPU1: failed to come online
> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>=20
> After that Linux is running on ARM0 core only. Basically I can create
> another cell for gic-demo.bin, I can run it and shutdown. I cannot just
> destroy the cell with getting ARM1 running Linux again.

Yeah, this is a familiar pattern when things go wrong during cpu-hotplug.

>=20
> As far as I know when we issue cpu_down() the CPU is calling WFI
> instruction (Linux kernel page) and waiting for event. When we create a
> cell the hypervisor switches the page and runs the ARM1 at the same WFI
> loop at virtual address 0x0. I guess when we destroy the cell,
> hypervisor shall return ARM1 kernel page and cpu_up() should continue
> from that point.

Yes, basically save-restore of the CPU state, at least /wrt its relevant
parts.

>=20
> When I was debugging this issue that time, I saw then after destroy the
> ARM1 remained executing WFI and hypervisor page. I didn't know why was
> that, and adding AM57XX unit helped to solve this issue.
> But may be that is just a hack and you have a idea how to solve the
> "destroy" issue w/o introducing the AM57XX unit.

Well, the code you added, just like my original version, emulated that
save-restore in so far that it pulls the resume address that Linux was
likely using during bootup from OMAP_AUX_CORE_BOOT_1, applies that, and
immediately lets Linux run again. Hopefully, but that needs validation,
this will cause Linux to directly enter WFI again until cpu_up sends the
wakeup interrupt.

The fragility of this comes from reading OMAP_AUX_CORE_BOOT_1, rather
than actually saving the state when we take the CPU from the root cell
and restoring it when we return it.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e94f17f5-01da-00c1-a6ea-957de5d8bb63%40siemens.com.
