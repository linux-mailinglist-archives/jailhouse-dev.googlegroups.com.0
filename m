Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXZ4TUQKGQE2K7XNZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B733744D6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 07:22:55 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id p9sf4892427lfo.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 22:22:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564032174; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ra90YOI9RnZ2KoflKa2G5ulmFLmHU28A4k1cloVw1z+irbpmEp0p/k6hh7qPD/Izda
         YzHJ8ssyrNTJ5yrntehXu9VlEXeuU5nspB0zn0e6JIzQHI8+RZprKL66nvLGNK01dG2e
         O8y9clSn4A76vkfdaq8ebJiXabGwKFBitYECiJDp5i6FFGFZ4epaG2oAimcg0WxmKEG6
         rn1M2N0Ey4aIEI17+AFmt8WstdJXdHwFFl2yZtKr0zt82YLoNea5kRkNwWrEl0LBw8fL
         aChlIHPsTtpxCxkxtSSNgD635nE49CyWgD79LQfYCw1Me6pZTf9yVNZsesITDBFq+09P
         8tuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=SvMAR2vNJ4YaGraYj42V3V+ndrgmhxEMYGtm8AqjeqI=;
        b=hcEAicft7dpiGvK8NrjzrPJpXm+qDKGkt7rvd1OmObpVRJOd/PkqmjZ5HsLVASpSoq
         +QZmA2zjZmiF8tCUVEOpDOn0MR+S3KmKAIW7b+tiHf2r0iz2X5es76jGI01Evd61JY2U
         +vMgBHKBP5+uWIe3mqUvAX7ETLQOIPfk6e6jcKhPj0x86EmTK3VNMupUCz8r/JEfv1wN
         fmTuzkvdOy5Suw9X1m1qFEME2qclJI6eMvcMtlPQ2xF+ySJB5V0s83ARcZKY5XpLe9UY
         EA3jtcUN2I9ePl8fFbQOn5gmrwaQzMN0/dw5MGHTyHqlGKz+Y1E6jGvIM13NRiv+IVom
         yB3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SvMAR2vNJ4YaGraYj42V3V+ndrgmhxEMYGtm8AqjeqI=;
        b=DysWHY5geFK6rl/7taRlSQeKY07Yiu68740hVO1165JuAGl6Ti3cARFhyHkoUOb2N+
         a0NHZjYQdRAW2+XC+uLPmmW16RPNOGoOE28QEw4zRjR3Yj40VORKDGtjP6YaWyteMUaB
         Swx2cs6MxHbF4r/XxCNCNiBKHA881ZBEKIqCKSwyJ+qVp+/DWa99Z+Usivoo1+E7B5H2
         Vdd7mA7V4VNA4iJUbVWhci5O7uVBUuFA2hEnowfqtfZqkzLdR1ZHcZWjwETezv2l0qW9
         yyZxBL6AwLgAUgL7jfn87ksG9V5821adL7sSROtyhkXQbzGae8NlEyr5ArXfmDXkpa56
         firQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SvMAR2vNJ4YaGraYj42V3V+ndrgmhxEMYGtm8AqjeqI=;
        b=iK7SAdsfZH6JEqKJ+8kZTsAt3EHNAn3FTj+GFqIukEXVDYa8110AdyXV79u+X/ptju
         DfGeN3ZsAWic3gWUIfIf7tt6I8vIHzbxh73e38smoONu9ZpFX6LsV5DKybkw2BBpek41
         7mocHXay6xxu6v56XTZPZwdsTvwr73oYgLU+I6ufKOdFJLeaoEotY0ieVaiT2adM4xLv
         lOtaZ9nu693RjtI3oNL6UKdE4No7l56A5Yi+h17gqGjPEJ81Tcv6N2M/oDstmXWa3OQL
         XTDPlh4z6xMf8ixj2xCC2FQziGT81bxYDnFOp1YQJmLf2JKGNrpUOOpW+n1Ma/QM2wBL
         I86g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlg2XUxOQhS+CIFq6/VAb65YRuBo0ETWW9dnyAhQthRpD/0j57
	3wn/+AlP8FQNzVz2JrMm1Q4=
X-Google-Smtp-Source: APXvYqyNCT1dKUf4GqoYGXmxe0rYiShFBokG8wOtOYPRkFcY1eJN9TRkdJLEoQGmEJurs4XlRRJu3g==
X-Received: by 2002:a19:2297:: with SMTP id i145mr39607075lfi.97.1564032174859;
        Wed, 24 Jul 2019 22:22:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5307:: with SMTP id c7ls3992248lfh.7.gmail; Wed, 24 Jul
 2019 22:22:53 -0700 (PDT)
X-Received: by 2002:ac2:495e:: with SMTP id o30mr39910331lfi.140.1564032173847;
        Wed, 24 Jul 2019 22:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564032173; cv=none;
        d=google.com; s=arc-20160816;
        b=HShBKOSYaNACb4+IpWHzTnpPx7U0zQhE1qzjEZdk4Qiq3xHXQ9Mh4d9zXnldqD8RFR
         x9OOOBieSEceds1jy2KLO4M6mvRDyAxFe2G1F/tWH9FdAGbtS3BYQMbYlVci2GKBdq9e
         Jqh2mvL+T5AADhLKQRLx23b1mumZiKCraRZi027Rjvgoc+dnxa5zR1qHphSCm1qD9Ph6
         wlxcqfqrs+CxiqjhR86b+yCi+smGMNsrLkJFYsY34zPPeEFPq4a6EpIKkocb8OgrO8Vr
         QLlRbGltNsd6Q7NAYy8oj3A8PxUbrzUKCtdqw8GFWFmuPRBxVa/La1v8m1uIuPkYo2wq
         Y4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ohl3YlfAFQu9gZviaYn8oTP6tRPCeGMS9fO0uIPOCHs=;
        b=ycSOS4G1fEYzKrQNqrdF6n05imKTtDMhTPQQiim9MDTFme5MthFpV1fgqB5kqiGCCq
         G0hv6oOFYospAQ9DIeLbs6OzQwTQq/Ex/5O+5Rp5V/7Md1FzZslF/RI3tmP1X8WqeWzp
         lhe92CfrAbntAaWEcOrENXAPWAVvNp9uZnFesPUdtko8stSUoFq5vYx9BkxH7n1J36/m
         4FCoYAVG00gqdPWEzCtCyC6pDrzze5gH+JGZSnwhMhJeMekKU18HO5Vr+9bB92mh9cOZ
         nm+3A2S62+teRkJ2eHZJqm4fVzHfXLIMvHhMJSfXqDfzl6q0yAcvkKOO6j+mw0eQJ3S9
         5e9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q11si2331761ljg.2.2019.07.24.22.22.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 22:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6P5MqDV030562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 07:22:53 +0200
Received: from [167.87.33.114] ([167.87.33.114])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6P5Mq0o023464;
	Thu, 25 Jul 2019 07:22:52 +0200
Subject: Re: [PATCH 05/11] x86: drop vcpu_vendor_get_cell_io_bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
 <20190713181037.4358-6-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <22c86c43-3122-f222-6ac6-5305372e4e8f@siemens.com>
Date: Thu, 25 Jul 2019 07:22:52 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190713181037.4358-6-ralf.ramsauer@oth-regensburg.de>
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

On 13.07.19 20:10, Ralf Ramsauer wrote:
> They're now basically the same. Consolidate it.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  hypervisor/arch/x86/include/asm/vcpu.h |  2 --
>  hypervisor/arch/x86/svm.c              |  7 -------
>  hypervisor/arch/x86/vcpu.c             | 13 ++++++++++---
>  hypervisor/arch/x86/vmx.c              |  7 -------
>  4 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/vcpu.h b/hypervisor/arch/x86/include/asm/vcpu.h
> index 24872f55..cae5b554 100644
> --- a/hypervisor/arch/x86/include/asm/vcpu.h
> +++ b/hypervisor/arch/x86/include/asm/vcpu.h
> @@ -88,8 +88,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
>  
>  void vcpu_skip_emulated_instruction(unsigned int inst_len);
>  
> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
> -		                    struct vcpu_io_bitmap *out);
>  unsigned int vcpu_vendor_get_io_bitmap_pages(void);
>  
>  #define VCPU_CS_DPL_MASK	BIT_MASK(6, 5)
> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
> index f2ea313e..e1000447 100644
> --- a/hypervisor/arch/x86/svm.c
> +++ b/hypervisor/arch/x86/svm.c
> @@ -1008,13 +1008,6 @@ const u8 *vcpu_get_inst_bytes(const struct guest_paging_structures *pg_structs,
>  	}
>  }
>  
> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
> -		                    struct vcpu_io_bitmap *iobm)
> -{
> -	iobm->data = cell->arch.io_bitmap;
> -	iobm->size = IOPM_PAGES * PAGE_SIZE;
> -}
> -
>  unsigned int vcpu_vendor_get_io_bitmap_pages(void)
>  {
>  	return IOPM_PAGES;
> diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
> index 4c074669..cf8ff04c 100644
> --- a/hypervisor/arch/x86/vcpu.c
> +++ b/hypervisor/arch/x86/vcpu.c
> @@ -76,6 +76,13 @@ out_err:
>  	return NULL;
>  }
>  
> +static inline void vcpu_get_cell_io_bitmap(struct cell *cell,
> +					   struct vcpu_io_bitmap *iobm)
> +{
> +	iobm->data = cell->arch.io_bitmap;
> +	iobm->size = vcpu_vendor_get_io_bitmap_pages() * PAGE_SIZE;
> +}
> +
>  int vcpu_cell_init(struct cell *cell)
>  {
>  	const unsigned int io_bitmap_pages = vcpu_vendor_get_io_bitmap_pages();
> @@ -97,7 +104,7 @@ int vcpu_cell_init(struct cell *cell)
>  		return err;
>  	}
>  
> -	vcpu_vendor_get_cell_io_bitmap(cell, &cell_iobm);
> +	vcpu_get_cell_io_bitmap(cell, &cell_iobm);
>  
>  	/* initialize io bitmap to trap all accesses */
>  	memset(cell_iobm.data, -1, cell_iobm.size);
> @@ -115,7 +122,7 @@ int vcpu_cell_init(struct cell *cell)
>  		 * Shrink PIO access of root cell corresponding to new cell's
>  		 * access rights.
>  		 */
> -		vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
> +		vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>  		pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
>  		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
>  		     b++, pio_bitmap++, pio_bitmap_size--)
> @@ -143,7 +150,7 @@ void vcpu_cell_exit(struct cell *cell)
>  	struct vcpu_io_bitmap root_cell_iobm;
>  	u8 *b;
>  
> -	vcpu_vendor_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
> +	vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
>  
>  	if (root_cell.config->pio_bitmap_size < pio_bitmap_size)
>  		pio_bitmap_size = root_cell.config->pio_bitmap_size;
> diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
> index 8552cabd..2f46b7e9 100644
> --- a/hypervisor/arch/x86/vmx.c
> +++ b/hypervisor/arch/x86/vmx.c
> @@ -1220,13 +1220,6 @@ void vmx_entry_failure(void)
>  	panic_stop();
>  }
>  
> -void vcpu_vendor_get_cell_io_bitmap(struct cell *cell,
> -		                    struct vcpu_io_bitmap *iobm)
> -{
> -	iobm->data = cell->arch.io_bitmap;
> -	iobm->size = PIO_BITMAP_PAGES * PAGE_SIZE;
> -}
> -
>  unsigned int vcpu_vendor_get_io_bitmap_pages(void)
>  {
>  	return PIO_BITMAP_PAGES;
> 

This is pointing in the right direction, but we can be more aggressive: There is
no reason for struct vcpu_io_bitmap anymore. pio_allow_access() will only use
the data, and for the users here, we also remove the indirection without
complicating things.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/22c86c43-3122-f222-6ac6-5305372e4e8f%40siemens.com.
