Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBWVR3UAKGQEBLTFXLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62C46015
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 16:09:11 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id b21sf3811083edt.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 07:09:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560521351; cv=pass;
        d=google.com; s=arc-20160816;
        b=0whcPApRuEXj4wBgorfM4Rni3EVNBtjQ7W6TRyuAGsOxF0T9owl6Xlu5N2IUY3jwDv
         JG6q2zgDk0tGmbCiodYbtwaaaGS/cUfLWd5q0RZ4FLRyENJkKmcQ24yB8P1PJ8md1BOz
         w4VUjXWMaDk/d0noU+6JgKlMwGfgvjIy/q0bJikvgxZ6N4RSxXS8JZgH66Gu+qLnzEGc
         9XHFxTHdaCWu6xL3gXPZLNjtfn8E9GZLLL6B19q+055ab6nKE5/rvcq8/JnESxUzet08
         kyd8UAP4PAVnfsvbupQrn23jVsVE5gutMgkvw5i+yqHel9hMoJOXmk6fmPC+iNFSmsan
         hdZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=uuzOTTbXEGGZ79pq9jsGVvS8r/UhJT0ogG+MLn0DU/g=;
        b=g1HB/Bdi7r35/47322GKCpp80B8wb+/QT677a0k52qSrVMrEWYzAycVxSw/bzQk7Nf
         LANggKxxcZL45vrBRAgs7s+X4KO14yXKCe0GIQQsSB2UiN3LwYkwdfdEbNXDV6av2xzf
         iHrsNMiDmszrOVHl0QU8jBUrjrldIX9tCQ+TAqCPHo8U/Ikrr94wLPJGVFAVEDLJ4J65
         jLfCxzm8j1SjvT/PL04MM9NIxNnlwhLZT4JX28MnVepEpnMwnuHZo2gmxK8OC/gHLRU2
         mahokvny4PjuesygVGuu/abt84npQcHh10vMrS098bVp7difVrBNHuTs5nRbTCk7xgKD
         It4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uuzOTTbXEGGZ79pq9jsGVvS8r/UhJT0ogG+MLn0DU/g=;
        b=lp/NqdPxv+7WlqvfkIbn5pddvPsf/6dDk8cOdjmXwmZaCUGXj1zULYE7PO51ilae2Z
         sFXR0/zcLlVNHGxO8kcUK3NKN8nDbM0BJTexjq5pnuXQTrPAg8wlNKSwjtto33I9sFvZ
         F/a1gAkkbvi7J8t5ZM13/tWUGOLZnMuIB/AlrqF7jf7s7VMTTcAUs38Q3+iN/kDpRqRo
         /FRmcJfeZfPM/RdIOshrOPL4MegSbDT+x2zMFBE3eBxrF+w07Y4xx5dhMV89DLaAYQOB
         i/T0wY552D2sn/9J5PL4FubaHVqctSU12wAWr2P7NZEH8DRcKwDDGpm6pTSdNu3OKmDP
         ofMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uuzOTTbXEGGZ79pq9jsGVvS8r/UhJT0ogG+MLn0DU/g=;
        b=D33nlacFLRLmjrPMEq+cY71pbtMMgpf+hgJEi8t+NRF4St9Zr+4L5L+LLEQ+/4smvr
         qokA4L23uzYmMTbG9UGZoPsZdW5YWGUeDu+KoQhaZ1I3yNy2CvcuQ6JkKzjBwS1A+0kt
         8e6fxeGFtE0HN4qUnnymr1S8p/ehpymxjBqtfL8m3GwfibbtqiCsQhqDtPIOw9KMXhsJ
         kgLqwuiGPad4QHdZouSeVoqOfzyHelvduryxKGxrcjqI1Jr3rWuBGRu+Q8VxLy2kfGk2
         yS7gN7l6X2+ywjPSh0AMfKlSm5qRHXCG4kDLyj22kf+7bz1AThwpwdznOTH2rPTaTCjF
         deMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVGn+lB63E2OeZCrHNVi00JIwEYBSptb/uNiEShM4Ci7RRzXuxv
	TQHQmin9NORUqnaQnE9pLxY=
X-Google-Smtp-Source: APXvYqzGjTuXnRirD4DHJiAPtkOWSu1LQkMXEicF/NIo+HrzMP7cwAcBQ6grirKDyf9VfVAQu5uTSA==
X-Received: by 2002:a50:ca46:: with SMTP id e6mr68054553edi.275.1560521350983;
        Fri, 14 Jun 2019 07:09:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2f91:: with SMTP id w17ls2190048eji.16.gmail; Fri,
 14 Jun 2019 07:09:10 -0700 (PDT)
X-Received: by 2002:a17:906:6817:: with SMTP id k23mr66431312ejr.121.1560521350413;
        Fri, 14 Jun 2019 07:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560521350; cv=none;
        d=google.com; s=arc-20160816;
        b=TLapUR+EpSUZzv4ROofDaxD1f0JsLG49GIBg/XLPoVdANu8sODBd3JPZUoXg18q9po
         28xhpLtWh4bvs23d7R4cJSyPVU7BvzmHgiP5jbyPApkrCj+IacK/keiqCUVm57Ui8xeT
         1XErI8nL4qc7glURGuEgKLbzJnDxYXzISB7yw3/k030akXTv80IKZtYeuwEVZcqE9fQi
         Z8QLgDZdeL9lmD6oiNZFPp5yICvCQJywe9C4dSf41VxDTVQmkww8Zbt80yb8YScdtg9G
         Y5wm+zIMzDIMe1TSWIXfgUY1AT0eswRIuS5PNjhs+O1qd0NwMhGmAYH/qzCdvscQ/7tt
         iBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YrLValwV48DiTaWdA3nDLKzdel1q8baZXUxEuS8dI3o=;
        b=x6Jh/zN8Ecis85GX8+gtMrMjLEjXv3IKz5DtT38mT2o9YfZghK/Vei74PSEtHCzAG/
         Vzf6ma1x1qEpqebmanCGlD3z8pJVnNGhN5mUcS7kkW3e7HMtVrrXIKQCWB0fx/Dw2Pw9
         SuX8YmcIwRDC+a1KH/Gn/tc3RRqFNklr4BGsDWLIxZ8UHh7ZfflOo/nKltXsWW9tOwmf
         Wq+5ahTymKMniTUtAR93RXQkFUF1os75wijsyORibWV6LIomTQCxHZYRVocrSig7EsGX
         NtUhbLTLciD5q6gJm/FGfQE3HK+ofr1/m/ZmIqU0QrZpUa8ytWPgqb2D+/UbczklcEtF
         q2kw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z20si209634edc.1.2019.06.14.07.09.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5EE99Bn012238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2019 16:09:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5EE99fM010720;
	Fri, 14 Jun 2019 16:09:09 +0200
Subject: Re: [PATCH v4 8/8] inmates: x86: Add SSE/AVX test inmate
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
 <20190613200442.18984-9-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <411de940-d9d3-e716-481a-6c892701ce27@siemens.com>
Date: Fri, 14 Jun 2019 16:09:07 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190613200442.18984-9-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 13.06.19 22:04, Ralf Ramsauer wrote:
> Depending on availability, this inmates executes some SSE/AVX
> instructions, compares the result against an expected result and exits.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/tests/x86/Makefile      |  7 ++-
>   inmates/tests/x86/sse-demo-32.c |  1 +
>   inmates/tests/x86/sse-demo.c    | 89 +++++++++++++++++++++++++++++++++
>   3 files changed, 96 insertions(+), 1 deletion(-)
>   create mode 120000 inmates/tests/x86/sse-demo-32.c
>   create mode 100644 inmates/tests/x86/sse-demo.c
> 
> diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
> index 1f30852f..030e20e6 100644
> --- a/inmates/tests/x86/Makefile
> +++ b/inmates/tests/x86/Makefile
> @@ -12,11 +12,16 @@
>   
>   include $(INMATES_LIB)/Makefile.lib
>   
> -INMATES := mmio-access.bin mmio-access-32.bin
> +INMATES := mmio-access.bin mmio-access-32.bin sse-demo.bin sse-demo-32.bin
>   
>   mmio-access-y := mmio-access.o
>   
>   $(eval $(call DECLARE_32_BIT,mmio-access-32))
>   mmio-access-32-y := mmio-access-32.o
>   
> +sse-demo-y := sse-demo.o
> +
> +$(eval $(call DECLARE_32_BIT,sse-demo-32))
> +sse-demo-32-y := sse-demo-32.o
> +
>   $(eval $(call DECLARE_TARGETS,$(INMATES)))
> diff --git a/inmates/tests/x86/sse-demo-32.c b/inmates/tests/x86/sse-demo-32.c
> new file mode 120000
> index 00000000..1136c98f
> --- /dev/null
> +++ b/inmates/tests/x86/sse-demo-32.c
> @@ -0,0 +1 @@
> +sse-demo.c
> \ No newline at end of file

Replaced this link with a two-liner in the makefile.

Applied the whole series to next.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/411de940-d9d3-e716-481a-6c892701ce27%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
