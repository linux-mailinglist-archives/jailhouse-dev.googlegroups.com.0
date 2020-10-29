Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWGY5H6AKGQEVKLPCWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37E29E3AA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 08:16:40 +0100 (CET)
Received: by mail-ej1-x63e.google.com with SMTP id x22sf806304ejs.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 00:16:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603955800; cv=pass;
        d=google.com; s=arc-20160816;
        b=ei0L9ILEcOJG3dtAdJgKrWap4VNb5aUgsuvZ8TmWClO/hKJudUCxNHtUSJ8FcQx4kF
         jwRn84lMQxRXfqNWkH5Y5fvc7cpF8JXoFCVepjWVXOX+nrF81iPVc/e9Hu6tFOIap63K
         y7UXEIB0dEMj5S6M/aXR812J91fJcp0jymdZD3/KBq/gAKoRkKlIecNbpDAccvbDi9qb
         A3FDRNYvgPEQCX0pZNBP17R2vv15ZaLFI/yLjTnGCiZB/oWOch5Oj6CrOU9ND16Vqzg5
         pG2fP/Y2E/kQqa0uq3zrccdSIN7VjK6iW4VD0qKZuulkEAQ2y+DxXQErTwzxcI+Q1I51
         5gJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=R7xa1Y0CUaMquGG+BilsxoqdTmAMJ1O8stihgXKOtyg=;
        b=CLXDAudwLz0Cqyl77REolGy60FyMcJjbQczBRyy5KP4hV6d7A0bTqqGENW53NygUA/
         hJTJSViOa0ge7biQMeO8jGwpNFZFpsjQXhUUwsL8nSFNIqR+zaP/fPdpJYSLUmNNITH5
         lxUHr9WxhQc8KGYmUlNexTFSSriS5nkE/YlpmRcaSzZ8G6u7ZNE1yAJDZbh7J1TEeQ9P
         opWDtgemQXjDFNmjPLzeQndTkkqktSGaTqDczgpSrRosmvuTElu/Gn68r0cBsJRyvddn
         Y51cff65vSB0uYCy6hTDU6DsKZzZpcABybWrBizr8iIIbtoj9q4otTngDvXu+AGEw5y9
         kPdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=R7xa1Y0CUaMquGG+BilsxoqdTmAMJ1O8stihgXKOtyg=;
        b=sfr53trFZrUjwhx3kYE/HOXHW/exRUm5Z+2petQRG2n75lO4MnxV9iE312xW3D8hB9
         KWKvTIRLSk+amQmH7TazET8TR5OwZZRscEZKbEdnCxOslTZcnSroBcj3TeeNQEdKLSnw
         XaA7hqtZ0gz4LH1NnN6O8ESrzmU0viBzVWf7MIwzUnrDDVR9CxRWglAv+1K/sxl0/gd5
         kBG94YWAVNkEmdehAkn+QRlpw2AG97AOStSaQxZIahfLe8UoGRvKXpa456mzyyr4PDsD
         uSXPHwJGeDYKtSgyO+qn6i+8xFQt9T0Zg3gWEhhoF+viotA2kYfhMBvOimNQvlls1hCL
         K5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=R7xa1Y0CUaMquGG+BilsxoqdTmAMJ1O8stihgXKOtyg=;
        b=ttqtVGy4q9jt+i5Pd4ev8hMrtuWP4CD2sa39hQ41tr+d62HKo79ZSmkzqAZi1beyo6
         R4JJKD0Mrqz71UOp9BVjtwcrsKm0pkOZ7gs9p2TIoylQczFFT01zkVuplJ6mtTgFNle6
         hUPvjRJudoVDAIiTzsrsvihoXptJ6GLiIL4KYEYXCZxNjM//HrYDTYD1pQbLBbjDg89J
         xEPBL5RkMjc7NSipMBiQE3uCXB1Q8zOVWebRwYh6un+41mC6n6MXadlfS2CCiVkyqulq
         u8IC5wwna0y3uJrvkQ6tcPGCXfAlYHFxJV7g6+AdANr8+q74+iiCGvIOBPtH8LmPXB5U
         EUGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532lF562dyTL2f7JG1bO7RFJBvPZCYCCRLOfqKlYMaWlHgtlrI73
	3mw0KF/FEjt3hwgP0yUBSvw=
X-Google-Smtp-Source: ABdhPJzsp4/V63nF73oBAIw5qkPWO6/7OZP+hlEPiPoMhToUXYr4Me+B4ZYy4/FT3UfoFxaSrkfezg==
X-Received: by 2002:a17:906:f0ce:: with SMTP id dk14mr2793140ejb.539.1603955800514;
        Thu, 29 Oct 2020 00:16:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls1856523edt.3.gmail; Thu, 29 Oct
 2020 00:16:39 -0700 (PDT)
X-Received: by 2002:a50:8125:: with SMTP id 34mr2699787edc.39.1603955799319;
        Thu, 29 Oct 2020 00:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603955799; cv=none;
        d=google.com; s=arc-20160816;
        b=whlx9wi36xAVQaeaQ825GqAW4Z0r+tbvOZaFZLpGVTH0cr36D2kz5O8CqoV3abqu0T
         3zGEjaDMVE6tHTS/Mqkf3f7FDswH7e0bkN1PloXD6o8SppacUcUVu3U0w+Qz0NUnbeF6
         VFeOps47Y4kNwJbBqUW1A7amipemjOpPM7ilBvWW/b3dIMqNVqm+xPin967btluuCoF0
         dl//slSGBHvC6NwZTnCHEDbTNwURZUtdMwl0KZLoie4lIpEcMJebSpSFQEIkx8K9gb/y
         0inw8cSuqJOfF0XumsRNNI5oxOm9uD2EoJZFvq53T7uG7ILcRQTp4wOJhTpcB9c3Mgv4
         gCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3ClG7ymul3BBEE9a3IymC3SUBmWFgXgHQHN1OMPTWEs=;
        b=WP17HUddpEkQyX+Afj5hnoWlu05afg7a1HSIHfRzBGTC8bIwsQwwvZYr7JeQQXi6x1
         BQ6zSmt1i75cChhydvQNUUbOtHZKZI5pM49USfYgrntuK/MwoWnns/a4ZpUGz8aX3VdF
         Z67wPY8zdtOTJ9nh+AbJ1V7wuUPQjoDlT9neO5ImFBv1aLf+aXAfhIjSou9mP7MDt9Oc
         8Uqz9KBYqFSYVX/cTVp1l7Jz2sHqbTy1QIeboe4O7lFdED0YzxNwYOAp31ARdRVT2yFD
         WamMSzO5UnyejKjoXdVgSbxVaouKqtUO1qp/N44Z4lXAmWCL40FGN0tlJR24LLi8ph/y
         qmdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id n11si84883edi.1.2020.10.29.00.16.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 00:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09T7GcoX017169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 08:16:38 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T7GcjE025203;
	Thu, 29 Oct 2020 08:16:38 +0100
Subject: Re: [PATCH v2 1/2] tools: Makefile: remove duplicated rules
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20201027214021.407707-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5020ab65-2655-00a5-822b-33707e28f91a@siemens.com>
Date: Thu, 29 Oct 2020 08:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201027214021.407707-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 27.10.20 22:40, Ralf Ramsauer wrote:
> Remove redundant rules by using wildcards.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  tools/Makefile | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index d336369d..e6945cd6 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -106,10 +106,7 @@ endef
>  
>  targets += jailhouse.o ivshmem-demo.o
>  
> -$(obj)/jailhouse: $(obj)/jailhouse.o
> -	$(call if_changed,ld)
> -
> -$(obj)/ivshmem-demo: $(obj)/ivshmem-demo.o
> +$(obj)/%: $(obj)/%.o
>  	$(call if_changed,ld)
>  
>  CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
> @@ -120,9 +117,6 @@ LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
>  targets += jailhouse-gcov-extract.o
>  always-y += jailhouse-gcov-extract
>  
> -$(obj)/jailhouse-gcov-extract: $(obj)/jailhouse-gcov-extract.o
> -	$(call if_changed,ld)
> -
>  $(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
>  	$(call if_changed,gen_collect)
>  
> 

Thanks, applied.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5020ab65-2655-00a5-822b-33707e28f91a%40siemens.com.
