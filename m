Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2VPYTTAKGQEN2R7BHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EFF158F3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 07:30:19 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id w15sf6746721wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 22:30:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557207019; cv=pass;
        d=google.com; s=arc-20160816;
        b=S5z1rw7lXwKeUzrW0S8gIN7SnUpFAn+DWcAOjeV4C5tDeHoahZKPEBlwdEmcxJ+SCQ
         gzSMsfYyfvVMW/ii67HWD7hnYs+Nc3YQpYS9qJ1Bys2BLuFBVWfg5wIgfaYfklP8fM14
         5QsZRf8dcjFeRY1MGSBzXfHiO65uhOTU6uBl11NPuXqj5RRFYPwlb+JBgdmhdPBJbg7k
         9w3HUQRGMpIMuU8+TlLnhrn1KojJqtDQ3tSuANS4HEOduOuNZgxGRyBnJwPEOK0OVadE
         7WW3nSmx0HQAbjpYi7NAjwNaANCzeEFhpU+k1K3lRQGu/1EqBGCjMkE1t1QLkp1q/a09
         7qEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=p5iYv0Wml7yJsnn7frEKCGU+Hxo9LtwTNmEHh9PCUDk=;
        b=eB9rXrzc27oOSc4wQG7iM/TSNB7e+B6bhlAODAmgZM9fY/voq8oTR1vqog4OsBbMn1
         wYn7dUxLzxuDDFNvvHAAdCp6nNsF8CrWJd66hPDJg4dC1nhPvBjRAd74uHX7nB9w0EAI
         36Fb8piNAi8Tyg+0qCEzZnzGLl+9gaH9W0EeIgn6V4xXKCC8mp6UR56Rxt+DH2qd/cow
         Ouuu3dJRw5Z7ILwmXqUK20lx0Gr35BNZwCwUaVEUlcIR9qay4kb5oY4/F9roiyYkywlT
         +F5EVAU43A2EW9SVaKBiZQ955pvmcpdQexnbFFScfGQ7ZO2grLu9nCggoWp5+1llH4n2
         HGfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=p5iYv0Wml7yJsnn7frEKCGU+Hxo9LtwTNmEHh9PCUDk=;
        b=GMaa7Qgm3z8q83fzkICuY4vCqWTCrS0wyYg1eRFSYgUV8aBAo02VQlmiOfUIjekNm2
         drqIYvW3klQbvnIF3S+GC3U6IxJpWJav6i9w3E3eTMz1rokQ+oeHi2WXGufgemsfk6P1
         qDgKNkrly6VoDRV5uenUOpHSTeoI++o3MfqMYT+wcV/dc0qTcgyLRx1tuyi0ztUHlOye
         +BPobIhFaTB59hgmkrj/KD8afe0pDb5owRKyuWNaeG7TTwpB0k3UPJ7DFiiwOZaLhjP4
         d/N06+PpEAS7xwbMTNwBVRbh4rC/ga+/ObvFjKhfJNYSMIHNuDuckHdVDNE8/kSmU07C
         Jdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=p5iYv0Wml7yJsnn7frEKCGU+Hxo9LtwTNmEHh9PCUDk=;
        b=i+SNfdAPUCPjurD9oXD4SOI5h6X/VgywuRgnQnBiiQGxuJ+wQiBljdKg1uRQmnb4X3
         nbCgM8QDITWR1cA9qGstHdji+8GB5y/a2cASGDzaGdFq9GviyZ0xhca/hel+QNnCJe4M
         wsV7/HRE26UkQFZtLDDNNwnlfHHXtkWHqUsLS0A8L1Ued/7V0zkItRdumdGps59c5+AX
         /M5HxwgIOYdvImy+Wxba1vu2D9conho1oZvI2lAH93w2clelgO66ie5lYjJWxK5i8ATW
         OZXHU+tte3YzlJNAvahuVGc4xQEtm0G9gHobG2111tKxHZeYM/7EOdel1hz9ENA59qkc
         Fvvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUH8qxwKZJGvt3GuvUIm90o+ruQqtjXz5uh1RtLczLvr2qCAm6u
	jLDaqFALsjfvMfbTAr7dr3w=
X-Google-Smtp-Source: APXvYqyDqptCbtFfgbSutrEQB/jMv0M7hx9g3AukwrbmNX2cORvlYDx9JLidYS517JpHQ5vZ72tS9g==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr18952377wml.108.1557207018978;
        Mon, 06 May 2019 22:30:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:6:: with SMTP id h6ls3585699wrx.16.gmail; Mon, 06
 May 2019 22:30:18 -0700 (PDT)
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr22075190wrn.9.1557207018009;
        Mon, 06 May 2019 22:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557207018; cv=none;
        d=google.com; s=arc-20160816;
        b=fe0SAzztLF7MuC5yq9IOW59zw2xqdgLNnyQZOVRXC4kq5cjhzQXiJEd/YRiL8meyAc
         SGNDeUW1/zCtZZF4XM+UiZ6ULFeYjvie42hAM3fy2EfmG5uf/oLgMBmG3QI8dWsgwNvS
         K5gnCCAYsuPqdRdFy9Z+XM7uaq9ITfIR2kJu3l7Aw350ZTtuQ64kke7wuQCxXb7s9fkp
         h8e5P+lDuXlFqpa7ZX7AIdxNg9jUuk60mN6yQ4UYp229v/qtcBVXwexrQpsCkOX15s0F
         mr4uYZfLGNnN14/xD6LzmZ2w8AJyA+OiyDXxO9DCH7O/yP+1d7yM6xPzGzw/VIcWkc42
         AZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2bca/o8D0shgDQULRG7tyaw6RDluA50NT2kDkKEQ8Ho=;
        b=r3OGIEjjX0Nk8mzK78D3/nEih0LzPKWSrocGzg0lokNt8YoLA9Vm74+JgJ6HiKrPf3
         bZPvW/zKynPtx/wXiCwL8OIHfPy2b44ZQZhZjfReginikWYOYEBSdOuWqxhAl5o0VrzO
         oWigdmuhKVSLzCzY2XT+ocO2XZwI4+ivFDg5dw4m1rAU5IPoTn28SJXvAE/UswR+orOu
         l1PZB4Q4wDjEyPpy0/HYRNEqUsbAZoGMuW33PtUpkqH1cs+3SsFdefKjEXpYlllgAzjl
         p4D4nzculQxfuKqzepy+YEzjQIuRo/cRQD2Rdrg7L2QGgd0WeyyQc5TDdvKO8O/15KDI
         wE9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d14si616534wrj.3.2019.05.06.22.30.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 22:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x475UH0C007488
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 07:30:17 +0200
Received: from [139.22.37.57] ([139.22.37.57])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x475UGHo019612;
	Tue, 7 May 2019 07:30:17 +0200
Subject: Re: [PATCH] x86: test-device: rename comm_base to mmio_base
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190506220151.19087-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <50a4990c-9e44-8e30-6edb-205e51ccd0a2@siemens.com>
Date: Tue, 7 May 2019 07:30:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190506220151.19087-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 07.05.19 00:01, Ralf Ramsauer wrote:
> the name comm_base is misleading: the adress is in fact one page inside
> comm_base. Guests call this page mmio_base, so let's call it mmio_base
> as well.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   hypervisor/arch/x86/test-device.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/test-device.c b/hypervisor/arch/x86/test-device.c
> index 1ce8eda1..cf81e92c 100644
> --- a/hypervisor/arch/x86/test-device.c
> +++ b/hypervisor/arch/x86/test-device.c
> @@ -76,14 +76,14 @@ static unsigned long testdev_get_mmio_base(struct cell *cell)
>   
>   static int testdev_cell_init(struct cell *cell)
>   {
> -	unsigned long comm_base;
> +	unsigned long mmio_base;
>   
>   	if (cell->config->flags & JAILHOUSE_CELL_TEST_DEVICE) {
> -		comm_base = testdev_get_mmio_base(cell);
> -		if (comm_base == INVALID_PHYS_ADDR)
> +		mmio_base = testdev_get_mmio_base(cell);
> +		if (mmio_base == INVALID_PHYS_ADDR)
>   			return trace_error(-EINVAL);
>   
> -		mmio_region_register(cell, comm_base, PAGE_SIZE,
> +		mmio_region_register(cell, mmio_base, PAGE_SIZE,
>   				     testdev_handle_mmio_access, NULL);
>   	}
>   	return 0;
> 

Thanks, applied.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/50a4990c-9e44-8e30-6edb-205e51ccd0a2%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
