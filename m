Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB67572AAMGQEFKET33A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id B755F31236D
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 11:20:43 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id 2sf8328122ljr.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 02:20:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612693243; cv=pass;
        d=google.com; s=arc-20160816;
        b=atKgPaMiiLacuDk+3FmzQqhFv6L4i99AvzpItX29oaZhy2LNotMF8xMZYqFptmJgyB
         eRrTgucnYuQnb1jY7p4gVlM0sAeU44QX7BnNYRMKPgVLC9KLbwWqBkUzvP62oAnjCs3s
         gqHwXrvtEw67Wxo3gcSIUodktwgNu605P0WZQzgesf4dPtr6w9w5++SUVc3K0Vf1SG9P
         nciofnFBzK7y6vb6I/zY8x64bISPtFoWMsI8x6gUZ9A6tw49EwVP8xUh1c1G2JrMdRna
         E7wAgGHZSPGkDR11YaOk9J/BY6hLes/humLP8Ts1rgY7oaTK51bNVlX5wfcv4yH05mSD
         RMFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=IXe6uF98gBgeN/h88yxO3JlT9njfOWzpzpsI04cB35o=;
        b=r4344OU3PX8W/lFlkfZruWzhuLYKHSLbKxw49nXcCvEQTOH1YZ9xl5M/Y9+7Kp7RBK
         nqeqRjhxQ7s6dtmkXMe0++UyOEaTOrKB6dr6EZxbSZLqgOKzujkCTRYlhx9DmmX9X1gd
         yCx+F2rBZtAVWrcruqGjTvCRSlaawH5uoOLr7OHGX5O6Vq3SHx+N3urwK05FoNZGQ4eR
         1RYCQCrFZI2hXYLhudj8eYEkeJnOcGP7CuqZSuS5zgPQn88VzF/QsDMHVwK+wiQaXZ5q
         B9qHrp3WKIhLLfaEsLRTCgp3MYERvwqUwx/3gVQ+1Zipk8uk1EiqbF1SBuQJbZKtlfLy
         UW9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IXe6uF98gBgeN/h88yxO3JlT9njfOWzpzpsI04cB35o=;
        b=pJia+n3GNvJ5islYPEjTzhHpqRra2mA0tvBv8/OPMwq5Zrp22lbJq1ybT30SdTewup
         kNgXJ1B14m3PgMbEyxa1IZ0Mg9RLogblF7YaNd1KQ+z0WmtPL9ZdgInVsFahWAs4P4Un
         ZuwpURKmN6l++EPAqvLzTXK/+VTrM/SjbQ3kmE9DLtNuwoNOxU+s78v65uiLRrW98o4e
         ed59ieUyAcjtIzzpQ1y51g9fDKZm2P92frQvFwYzCFV7U51BzRXCNb4rOZyWJrVDfzQt
         lEkRjWIwVJbnnExohAYrBbs8lAOyAvKAUm4uPNWkhJ8RMPy4OgH2oNvt4LeZoTHsKQtB
         afHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IXe6uF98gBgeN/h88yxO3JlT9njfOWzpzpsI04cB35o=;
        b=HNux2Yj5Rdbmo9hp15XzRX7b0O+o/Z3a5ii9oZbgGlbqWsvTfIw8CZXX3IYvdTbjEn
         5RYke+L15Vp3EPPdqoyVeMmXwn86KBG46QbpsX4AaJuf76ne/DWK0Ehp4IuXDl4/6glY
         ibahrLCbSJPksLTNiyQGZrzBFOn6GFFZ/WaYym+gz6NXU2gTMuloSn4EzpdHhjGSPCLz
         U9aEVYNeleb7gt1IZy9WaHX6EAhNJkiR+XcMg3VYsp09MOGkM606a7m8kQ6N7y45Gr3Y
         gHqzuEFr3aHT3kmjS0vknsH+q06tiJcD0ZZ0QGAFpQ8A5TFtPrGmGngssaNAYUwhayVw
         4K5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NNLxQ5dmaQNkuXeuQqJ9XvTgxVBQxraoStV90iDHe4AM8fGxj
	t2LhALn1WQRhXqTwqt8okS8=
X-Google-Smtp-Source: ABdhPJy1/3sjVLoh+ubAgB6ec3FMn+vkRK7pbHNqcZu+2/HAHSPEdWaDkApouvFXRu0nM6/D6t810w==
X-Received: by 2002:a2e:5814:: with SMTP id m20mr7733468ljb.288.1612693243310;
        Sun, 07 Feb 2021 02:20:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:518c:: with SMTP id u12ls313599lfi.2.gmail; Sun, 07 Feb
 2021 02:20:42 -0800 (PST)
X-Received: by 2002:a05:6512:3748:: with SMTP id a8mr7234822lfs.31.1612693242240;
        Sun, 07 Feb 2021 02:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612693242; cv=none;
        d=google.com; s=arc-20160816;
        b=s41AljB1C2hDRt06BJn7TDfOGc87utVU85bZEBv+cNdAGFnlCmgIzZVOxOp0llYOFV
         QcuTWQqikh9ukp8EAETk0cbxMitXKkE8Enz5AtWB01YJqPQkxvlxEvWj01A/Qe1qBd9J
         xJb9kl6mlo2vUulpVTZgHXyCZfxxnQi4X1WYimGYP84tblVvWIPjB5UrU1NksEYJiCqh
         /r05zP7PChFpRT6n2W6BaTUyG66oe8yNN21NDNQ6GOFKCw2nkOhnAntbY55DBKKgRJGy
         uA6jbMrLmEbwb8Y1dYkXqL38DWutqhqv064+lRXip98kEVqUxqAN0ABLsrkHuKR3yvNp
         6b2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=JEXBu6mWf2BD1KBGO5ALhflYGP/OtBL0I4UgQ+L/0PM=;
        b=NXhEpGac9hZrfQyqUd8sLO+KysMQrIL6TvsyM7cBoHm1n5s27hx/yjQu0U7sF+6sck
         mtmBwwg4i0QKaAZi+Le1m+bnMk8Q8r3j57OEDBLZhw3p3CzqlOjTYxSxCzglI5fII0FQ
         cBDSVxE7BDHGMSSUy54dvjO12Ar4v8aWaqknFLHuu3fYG5vsLhP9gzvbAqkMHl1q8WBM
         AFES1yj6zNZowUZODgQjEizxy+iu+uxQ6QarvohVCv2PACyWJ8O2HLZrYtcS6d8Xdo6R
         s02WXFtefFhW6woGWBfFQgGYt4XNyOBpXjDyqCIcgN1NMFIz2WiAQb132/mvq7SYDe8X
         y/jQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f18si767232ljj.1.2021.02.07.02.20.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Feb 2021 02:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 117AKcuP024389
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Feb 2021 11:20:38 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 117AKWjw018004;
	Sun, 7 Feb 2021 11:20:33 +0100
Subject: Re: [PATCH v1 10/23] hypervisor: provide runtime assert() helper for
 DEBUG only
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-11-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <26da777c-4140-d916-e8f9-3c86b171f3f5@siemens.com>
Date: Sun, 7 Feb 2021 11:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210125120044.56794-11-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 25.01.21 13:00, Andrea Bastoni wrote:
> Debugging is enabled by adding CONFIG_DEBUG in config.h
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/include/jailhouse/assert.h | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 hypervisor/include/jailhouse/assert.h
> 
> diff --git a/hypervisor/include/jailhouse/assert.h b/hypervisor/include/jailhouse/assert.h
> new file mode 100644
> index 00000000..eedb1b9f
> --- /dev/null
> +++ b/hypervisor/include/jailhouse/assert.h
> @@ -0,0 +1,37 @@
> +/*
> + * Runtime assert.
> + *
> + * Copyright (C) Technical University of Munich, 2020
> + *
> + * Authors:
> + *  Andrea Bastoni <andrea.bastoni@tum.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef _ASSERT_H
> +#define _ASSERT_H
> +
> +#ifndef CONFIG_DEBUG
> +/* runtime assert does nothing in non-debug configurations */
> +#define assert(e) do { } while(0)
> +
> +#else
> +extern void __assert_fail(
> +		const char *file,
> +		unsigned int line,
> +		const char *func,
> +		const char *expr) __attribute__((noreturn));
> +
> +#define assert(e) \
> +	do { \
> +		if (e) { \
> +			/* empty */ \
> +		} else { \

Just if (!(e)) ...

Or are you trying to emulate unlikely()?

> +			__assert_fail(__FILE__, __LINE__, __FUNCTION__, #e); \

assertion_failed(), and underscores aren't really needed.

__FUNCTION__ is overkill.

> +		} \
> +	} while (0)
> +
> +#endif /* CONFIG_DEBUG */
> +
> +#endif
> 

I'm including to make assert() work unconditional. People should not
throw them mindlessly at the code but really at places where things
could go subtly wrong and we better fail in a controlled manner. If
assert() worked in debug mode only, the barrier to add it could be too low.

Also, it would permit true BUG() == assert(0).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/26da777c-4140-d916-e8f9-3c86b171f3f5%40siemens.com.
