Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZOSSHXAKGQE5K3L7LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF62F37B0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 19:58:46 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id t27sf684783lfk.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 10:58:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573153125; cv=pass;
        d=google.com; s=arc-20160816;
        b=JLNNNxd26d/oeP1RLlxotq5SS/DhZdT9+9cIGnvU4KaeWCjgvUVyRy3dJsdpxJ65qn
         B47DHPOTrKJr17cwy8QcLo1FpeFY/nfM4F+AJEXaTN0xZE0YeNonDNTI3rYlc1dUxV3H
         3hCK1p+pxXq34CIU7q898U6d8hdSGabugMWYOsDV4JYWk6JUfDlIigJqtxh85zIK200v
         +ElhC91nKzcUbih/SQr4zcxg6X2/yvlfBTVa7r7j31zzQu3v4kpPF59cuDBpIGLMqYsS
         UeoVxzAj48MbEiEOT23WdWqAsniXmOA/Sb3XE6eRhPgi1Y+G2gusD5Lbau0rLtv7+t/B
         MtJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=z/JqfqeYdiCdzMAigfrVvzTU6MHw023lPl6MNfFBnTc=;
        b=tyPw+K6XFItAdlSOQv9LqHHvigxh1Ik3FhsYB49c2Qvk6YINVMcRdOVzKiz38SzEP7
         wqyVdURlY8ZdhEwS/p+j80Uq00QiidJD1w36eHpjSYmKEa4ma/2jMzN0blS/RKW85Z6H
         Qj90l94jTr5aLVdTPj4aUZ3XzbzZb9tjjJFpxzHYBfyaKGtj9oOFd9mdguuW26KFeKNb
         YZnOr6hlWTM8WAFTR2jZ2lvLHeowGisl2Cc8/PyjvkBLZ4NAT96uozmWVEYPJuBN+IvP
         kJ+BzXx+10PRkSFpJuHgxWRE5J9xF8s0x75l1bYJNEkE2jfuvukuvyfTR3I6z9+2LA0d
         s5kA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EbFfN3aX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z/JqfqeYdiCdzMAigfrVvzTU6MHw023lPl6MNfFBnTc=;
        b=pGP7eTWwpDdZMqEPgN4rE6PaicUfWWF6JdNuH2dOfhTBAnDeCZSgg/SOTjOsW7Kj1T
         sSUdXnIQBbuWggraQAmhJe7AFBgZ5C/CpsjZZtvGpUjoRxY546yHinSLuSvItZ/8sDns
         DyX8kqguxUupH4f30gQTk28yX2Da127KweT2xNC4mubPIHCZ4vheVrTT0erco7Y81ZNN
         Ims9gsCStch19YDA1mAP3LLUKMMUnCOvBo/BNpUtJCfrHzmc+Vk7Z/OcmC59DrRKTIBw
         rZxvZ8r/hqseP/qTSr7wveGYeSAWFDgRuSbsoVZcWAOJ0EEqWZ6XmLW6matfz+ggg9RI
         g8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z/JqfqeYdiCdzMAigfrVvzTU6MHw023lPl6MNfFBnTc=;
        b=S0XuGGR0wVwJmenrfBY2bWJ+GuIv+aal3gfJAJ/uAhVSwY4rln/Zu1/wj7NeLWwCgP
         V6NrhbM/pQuqWR2EyeNrsg6dq8o7VJxsL61oTjfPhWSNbNeB3Fs9nYqaKqNHkrjMDjxB
         wDFMMvzNllVRsybiFSHK3RIkToLNTX8st4xzRv6TnkdzZLMwEgG16PXvMt6+NERGKxAs
         aPTftPjJoUCg26WSxFE/8Gyzay6jZgJNlvcnZKBnWtdPBHux709dXHDZ2NimCQiMfk+z
         GS91rkZ2VofgGNzkvSwPaNYaHV7RODsrE4HWeFEdkK239kqCmYw0sNBJgt8jAtGl89mf
         BSLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWDSJ52rJ19jaCLarHdQr7w/9ZEoxVXJIs8LrvOBrI9/YL8R8Yw
	JinX+9yIr3eaPjAOGc8/48A=
X-Google-Smtp-Source: APXvYqzqrYdaH3MEfxWR1Q95Iw35jvWSKwUhdh4JpeLQ2B43ekKg+qMuCJAm8mDXF+3HZWhYs37/hw==
X-Received: by 2002:a2e:575c:: with SMTP id r28mr3543016ljd.245.1573153125813;
        Thu, 07 Nov 2019 10:58:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6715:: with SMTP id b21ls1312524lfc.15.gmail; Thu, 07
 Nov 2019 10:58:45 -0800 (PST)
X-Received: by 2002:a19:9144:: with SMTP id y4mr3083879lfj.168.1573153125169;
        Thu, 07 Nov 2019 10:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573153125; cv=none;
        d=google.com; s=arc-20160816;
        b=ziNHbOUtx5Rtg9XIuvaCwDicRBIYG5gTpq7OCFsgppmBLfEXn5s665gUGUoKFGlzBJ
         GPNFbrFEibvQu5kS+Y/SH+q2AGHuWLBN6qg8vj0QghA4WrPxbcnPoqrTjQSiYJWaoOm4
         7gREahp5MzERIj/l9YStIcv6lLu+Qsb1KbJG0OUdmiBFvK055OjxziSYTFuNXy2Epso2
         p4hQh1MZCe5+k7UnXvUiShkvLK4cjhIR8NZQRERqCXEhAY4bJgt9NQvc6bkcAV6C3rAF
         ASYMnboQmhxfRybrAmwWdRUH7dLgtrfwo3HpN7ep++kuKN4DmsfIIGdeVDMeOoN6eip2
         qhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=ZzoIErUlfRMiZUqfzv1jCc4L7s/OwjrWit76YTCpFMU=;
        b=qPAs1hYLU7yqo4N2MTPb4hp56kaTvGT8j1D9L5h+7NoT2ofFM0O/a7kjeVYnP8d9Gl
         1i113j9GV6wvLE/BryifAs8WdpasqmSv5j2oxaxjZnYWCdXZADZwJSP6kfjD2PlXSzuu
         ncwNzaxL0tKVExUT8gFE2EbmU+NoRRhIVqYfmx218LK21frIDdXReV2ZNUVBwHIfwBPJ
         lcZF8xVa3eedHKtj5HoWK+HBhFAUWNGUX0jiPjIVW6sLcZN4GDY5mXtBVITcWlLZ2HjP
         T3sfkjq1JVthK0Pi8Ycxebqa18tPzMQF3b4fvqUSfuk1O5eY4Tgpenjdh2hU41QIw+RV
         S8Nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EbFfN3aX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id c25si193003lji.2.2019.11.07.10.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 10:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 478CNh06MKzyFy;
	Thu,  7 Nov 2019 19:58:44 +0100 (CET)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 7 Nov 2019
 19:58:43 +0100
Subject: Re: [jh-images][PATCH 4/4] start-qemu: Update x86 CPU settings for
 latest QEMU
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
 <237f869c07579c80e0fa121d64c100c257cae489.1573147076.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <0c4b85bf-adad-175f-38a2-6740a625ecf3@oth-regensburg.de>
Date: Thu, 7 Nov 2019 19:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <237f869c07579c80e0fa121d64c100c257cae489.1573147076.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EbFfN3aX;
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

On 11/7/19 6:17 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> With the next QEMU release, VMX CPU features will no longer be passed
> through from the host when using kvm64 as CPU. Rather use "host" as
> model and ensure that incompatible PV features are off.

... But why? Do you know the rationale behind that decision?

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  start-qemu.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/start-qemu.sh b/start-qemu.sh
> index 34dfd82..abf2537 100755
> --- a/start-qemu.sh
> +++ b/start-qemu.sh
> @@ -27,7 +27,7 @@ case "$1" in
>  		DISTRO_ARCH=amd64
>  		QEMU=qemu-system-x86_64
>  		QEMU_EXTRA_ARGS=" \
> -			-cpu kvm64,-kvm_pv_eoi,-kvm_steal_time,-kvm_asyncpf,-kvmclock,+vmx,+arat \
> +			-cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \

This should probably also be added to Jailhouse's README.md.

  Ralf

>  			-smp 4 \
>  			-enable-kvm -machine q35,kernel_irqchip=split \
>  			-serial vc \
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0c4b85bf-adad-175f-38a2-6740a625ecf3%40oth-regensburg.de.
