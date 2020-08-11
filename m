Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2UTZH4QKGQEZFGRLGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3DC241739
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:34:03 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id co15sf4221431edb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:34:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597131242; cv=pass;
        d=google.com; s=arc-20160816;
        b=CgTXuMLioBfESX301b/odm4AKzAIkqq6Q/+saTOWLrwxD3aqjNj9pv5bfdIaj8SzZq
         INsmpKWIpMEdRmMfvm3dgtMeWGR9fhu0NZAD9Jlybgv+x4fBSlYZ2t/R53/dae0ajafG
         2L/NNXFxVL/W4F0BQYu0alAfoj0Ydy/M9q0rQ2INM2lngQITLLO01rIG6kBbeJqbuHBQ
         AlbHR+2R30UJUjZsil7Dr5HXk5cik/ZTnG3smCoKfa6ZZZsS5lhngyaAxtFN4J9nJS+O
         kbq+ZqbOu5Iy0WndZfCYJwkTx4n4Gq3R9Hc8rfGojdhYLZYcbWdG6+VjvjViDWBc6q9y
         MluQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4LVw5yfiQIYyF8X0iZtk3dpFjRU4TQeXHXvNYW9oDa8=;
        b=y1sNbt8U/eBM1z3MSMtbx5azljT2uPQAmZP6gSQ/Uo26kGlEJtM287huCGFlnU0xcl
         FKl7riRk7MFh8oJJrilCltUYSZxEH95VmCIiJoLvxUs62ckxC4GppS06oWjfpho8bvgY
         HOJLNq6S5lKQe2pxP0v5WF5GalFT34e+P8GZdxJIW5DTnA3K6yIHdTGwBBppBtVaytLj
         SlohcPIZFCeO4BZdyCCAjeFfBHBDbb6Knt6tTULNrG0L67FY9KUNNfERVh+fyiiIdd+W
         M70p88pHJZAPVNpf0Vyj5hc8PgpznbonXRX210ivb0a9ymJem1o+WF1yZFHHyoKA8L9n
         y2VA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4LVw5yfiQIYyF8X0iZtk3dpFjRU4TQeXHXvNYW9oDa8=;
        b=ZKAD1xP0CULfoAE4dl2aCh8LJt1+v0BJ3sGnaBRKqSj3Yc768HpDP6pJ1v8JVYX3Zv
         Q5H8ALtcMxIOTzOjHFaGqJlLpY9ovRh+SIHI0MbYr10ytFMCqIYgZDA5bmvNuE/aX351
         2B5E3p8Eo3IhxY6VE7ulINYzNqP3j6lbn5sJM1cAJa7L1Hf4j6/ulR6E/iWNb3GBVHX3
         wiSd/pxcoxFRAkEBD5M8kIN+5JiWo8UonCHUKOhmSSgdqgs/u+K96/QDUB2XHjXhnIZT
         HQDLjaWwrGy3xyStSrMTB8vlIstUJ27bEULWRMdHULX9M7GeDXEr28Et74uEwpMEgcy0
         aTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4LVw5yfiQIYyF8X0iZtk3dpFjRU4TQeXHXvNYW9oDa8=;
        b=HB3S1nBC7jm1pezwZ5pZ7Q8tAoq4GqJvvmsUlS8pYVewJ5nfACzLGLdF5mwomha7HS
         nPg1nycehuzDoW836UE/tyQGkVaen6fJHf/BjQpdcX+Z1XNL8PCGG88QzDfQwmcEHhM1
         bp4X2P3U8VASbwDHqeWjhSnV+Bb6ghWla8hxU2MYnGc5tIFFtY6mrczpZpjJMwP1S9QP
         8yn+WrH+Kua6EvM+7DR14MA0gZJzeDmkDQXs4wU/8CM068dT2s54okAfBQUgBAdStfTG
         3Q5sM2jWnI0G0ZnPNa4baXPlA8XrNEPZPFowf3pWZ447G9ZdQnUAiUid9IgOtYB5brhq
         C+BA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531NC4xZwQWue22Oej+qiCJLGjV192hEgfsuGm6tWIdg0G6SEKWv
	V9oXMeyKueNjzGHfagrYqU8=
X-Google-Smtp-Source: ABdhPJyenE5wQufUxnIKWD/5evlURArMmRMdjmOplL/htAX0xAYIJGNm+JDBAg/sytH6tPeE4dvgwA==
X-Received: by 2002:a05:6402:17bb:: with SMTP id j27mr24036319edy.291.1597131242853;
        Tue, 11 Aug 2020 00:34:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b01a:: with SMTP id v26ls9227432ejy.8.gmail; Tue, 11
 Aug 2020 00:34:02 -0700 (PDT)
X-Received: by 2002:a17:906:8389:: with SMTP id p9mr26316682ejx.391.1597131242207;
        Tue, 11 Aug 2020 00:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597131242; cv=none;
        d=google.com; s=arc-20160816;
        b=Ju2hodgyIOSB6A86AECXndPkP/9A528qA9Vu75JZTb+x9644kyD4ytk7R1Yh5f/afZ
         gCPdCIwVEm4Sr03rcL6JnUbCVTtA4rJAR2g44qr7GIgZg3tBx05WtqqE4SC6pesvEw/2
         h3AQE8MmKPSprhwoKdFi4SFS+8zh+lWYhj4iKp8EjzajnNJvZyyGeppjlwwt9h7cnSBu
         v/yb8AuQkisQZ3/NJKAr8USftuLxm0co3SNF1PG3qXVHOuobavHPIKoW6rSFmbgaYh1u
         e9/kH2WncsQ3Oh6xcnWPsdz9fK0wBcID8rh/1s9jxAD5OAPCyNwU+jYPOYERTHPlv3Hr
         mmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=D7GglI0k0n11J0L1RhfoBoNQ570fGEAd8mUOkI9FnTA=;
        b=qCJC5JVkrI3CFV4y9fTYTsUquDO7gTZUdM/soA3HCFvf9XIGurBqqcq1cVH8Lpsu+2
         cbkMy6cAeSKXFnGsTfKh0nVeojjDfttL6DohNxSyvBNM3giloOexDFb8VPbKUZMboqRT
         LkviT0+AGH8ETXBqglefUAYdp2943sVz9agGBwg02OiDseiUxIDDlyou45/c9CD9rG7P
         QzF2giG3aCNoda/EXNuNJRGNnMlXf8BBdqYW2PKTrxbQEJ9G1MKGRRra7HcLSR+Ds17r
         VCZE75pWBWkwxzDlo/xfiVn1BJm4O3PIBiDLwRB4uJNJ/cTPj2UiOZu5RpRIqlAOh81X
         i+QQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id lw8si814556ejb.1.2020.08.11.00.34.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07B7Y13Z013200
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 09:34:01 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B7Y1WE005569;
	Tue, 11 Aug 2020 09:34:01 +0200
Subject: Re: [PATCH 07/10] cell-config: reserve an entry to align
 jailhouse_system
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-8-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6bc31f67-33dc-9ef0-73d2-68f7f52267db@siemens.com>
Date: Tue, 11 Aug 2020 09:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807030632.28259-8-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 07.08.20 05:06, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 

Reason is missing.

Jan

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/jailhouse/cell-config.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 6df4a745..77a61da9 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -309,6 +309,7 @@ struct jailhouse_system {
>  	char signature[6];
>  	__u16 revision;
>  	__u32 flags;
> +	__u32 reserved;
>  
>  	/** Jailhouse's location in memory */
>  	struct jailhouse_memory hypervisor_memory;
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6bc31f67-33dc-9ef0-73d2-68f7f52267db%40siemens.com.
