Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA5L4D6AKGQEZQYHRPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id C80EF29AC54
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 13:41:39 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id 28sf626538edv.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 05:41:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603802499; cv=pass;
        d=google.com; s=arc-20160816;
        b=lLFduvT37+/Fi0YwXNe7H1Nb94BetYm+aWM5w3AojVU8NnuXkNIVr1OYK9BUIhdQJs
         zplZN+7UNJ06EJvMJeciUUq4QGfaYS+dCeejjw8SeFAeSZc0F4gBX4FV027JsFNgShEP
         duOH9+B93DMVx9cfcefgKcP/oAVWWlHAqZCjiMOqc4EiFJ9hQy5hQj9j1iqHrDPXXUV6
         gXJxDdJMS5NXj9uW6lCXP9GZlqGpgPJj0aGscpzHbyZ5Zix3WJ7HgW4F6qL84JwTXjni
         hY5jrel0Xir1I56Ppr+LiuQqWj+SADIlUZlAMK4nVVGfMglr2gpP10lEQ9LiNFOxV+mH
         Ukfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=4hRiq6/6SE3/cf3jXD6UBn5+S3azURlUfpVmO0kVjCw=;
        b=r16p3mCfgPAECAA2vWfLwdKwFJ4Jw/cAwFvr8NAjxtc8COgzum705dOBO3Sboh5DP1
         5Ll3+W5b81WQF8Ljmg9psVnUz/+/tUFyL71slflkY4/mdqXFMm/39DY8Ydt0yIvQ7by9
         D8UNOo2IYjfbtC+SPg7z+p1Lc/DNzqBbrWODlHwWZS2ACKyyMEk+s+bo93zEcO8eYpkK
         Oxc/J8Ps9hOskoKYvlTVr0hX8sYp5vpyCmNooRah/axgbzAx1z1SV14atu7s8LURCgeO
         K2ekTdvIpvv8qMYgShUUHDFuQS2CMQ8lc9tRACkADZ2MHqjrfKG00Z6O9yooZJlXlsQP
         WGKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4hRiq6/6SE3/cf3jXD6UBn5+S3azURlUfpVmO0kVjCw=;
        b=UGdvgpCNh92PHcWSs4b2fCpfl6MGzoewjzUAIaNF/ADFvXVXFp2LnZmsUuzMM38Uwx
         lTBmaJvWikM6xBf5qCN8e61iEHqXvPZCSHMatvO7p0LOikWceCI6d/80b+yY6OiOYOw1
         sSov1dFKv3wKC4azWxSAm9/0zsLSPt1ay2U7ds90X54YIjk2NqaMFBpO2xaZsxOWgbOg
         5BAwvZohjiK73n7VNUsVjmTGW1Dn2jzax1oLBV6FuJAtCZM4tzeQIWc+U+QKLunm55bp
         72UsBhkb/w+fAtMoltcm7qB4NppW0Sa9YId/uK9/vzVCPn5qeMg50Vg5AGOL75RHtxIn
         eYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4hRiq6/6SE3/cf3jXD6UBn5+S3azURlUfpVmO0kVjCw=;
        b=B0pJKZmPxGdzSDSzDpcHRVfWnjiw3+nc7cVsGeYjsogqCrDqhto1jvb7L1Y8jkDON1
         Gkf0kZglATUt28LU7hlq7rbg8Gt3vjxyrceARLtLi85fxgIufBV06CeZ+Cqlso0xHpTn
         ALaYpLMee5hl8aQZdqVOofGqh3TTVFSqjfVt6R/BZxCyxVNPpqUQb/lu6egnvwtpNkev
         fcL0TQSQjd3p+M0hTPsM4bePawb1JIG4qwQ3I0pzZGfaVSH72/nbIe5/VqrZ73xV/PDz
         jA+cZeCm+vQY5ZCEnJJ9cgkaC9Fqvt2nY7Rra5D9sYWWyR9Xz5A406y+Qhk4GDA1ZA8P
         R2Sg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530k7kXS5ipb14b+0O2U0ZTzU3UZu8XbJUfYmv96mb8xMX3ifrCM
	jCUeXeFaEI3rKWmQ296fNMs=
X-Google-Smtp-Source: ABdhPJzNxfwds/8TZUOE6fXQtQlw5f1bzw3AZGAE6yetby5/koeSIofKwNjjVunbX3WjHiumvT5UvQ==
X-Received: by 2002:a17:906:3559:: with SMTP id s25mr2331600eja.376.1603802499532;
        Tue, 27 Oct 2020 05:41:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:38d0:: with SMTP id r16ls740437ejd.2.gmail; Tue, 27
 Oct 2020 05:41:38 -0700 (PDT)
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr2288686ejj.477.1603802498307;
        Tue, 27 Oct 2020 05:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603802498; cv=none;
        d=google.com; s=arc-20160816;
        b=x+7YgVPOyttMWn8FbWN9pXamh4Suq7u3zdFPYoykEguqa3b1V157VGNrd26pfMEN9D
         BCX9pYYJWZpW989nCjfbI+ypD3BgdRxfxIsnsozXvyGV6KX32Y5IUwENJQsKy0icU7Su
         yV1I3yra01rcSNPx6/HnvUlrYJdJpXLnBqG38vaqcvwFbPAomL50r85aN+ymHQhzJj4U
         WwunBLuyb2GxwJpJOxpiDsui7W81vH1DpHXTxk4nJmFtUst6tiC3DyN2GI+VK55FXc+9
         J8U8+9WEER1KczEv1yYqJSYBxjcIGRe8kgRJgifSEbfsDcUS+TBWTgGlivOng5lFc5jx
         i86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+Oj700tWWE1un/kGwt0xqZi/9jtc752xD8K3uLGApsI=;
        b=Oc51dDZxJ1/xOYLaGqEeA+CsF7r+2d5CCZIZvxya2z+HCu3qN766X4Vh3mf8EPCEae
         63D8n4nse549+tLhOlfbLlSgUtZHVyv6c0j1nQC2qQ7fm+6qJj3bw/YO1Od6FVGG5j8B
         8mM4acryMK2fYQijEB+4juYd90/r8dC7iCDjqW0f9uMaW/CW0oyD8NrCQcmlvf0rcth2
         71L9xWJ0RDR5kMsqKHPAVmRpcxSqBNTuR0w0YgSg3gxnUdW7iO90VbJBtYhXzecOK8UP
         2zh6s6vFPJXeTMUoQzbmPn9z0BgJT+ylN1v3451rt5ghNITtkA+IDx2uGkxW2hoQta9U
         Q+mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v18si39687edx.4.2020.10.27.05.41.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 05:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RCfboN016913
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 13:41:38 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RCfbBZ025879;
	Tue, 27 Oct 2020 13:41:37 +0100
Subject: Re: [PATCH v2 09/33] hypervisor: Makefile: hook-in -Wdeprecated and
 -Wundef
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-10-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1441e472-9291-dcb7-c155-ab4658ba874a@siemens.com>
Date: Tue, 27 Oct 2020 13:41:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-10-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Currently, no warnings triggered by these two flags.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> index 27dd5dee..eeeca2eb 100644
> --- a/hypervisor/Makefile
> +++ b/hypervisor/Makefile
> @@ -31,6 +31,7 @@ KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
>  		 -Wnested-externs -Wno-error=nested-externs \
>  		 -Wshadow -Wno-error=shadow \
>  		 -Wredundant-decls -Wno-error=redundant-decls \
> +		 -Wundef -Wdeprecated \
>  		 -fno-strict-aliasing -fno-pic -fno-common \
>  		 -fno-stack-protector -fno-builtin-ffsl \
>  		 -D__LINUX_COMPILER_TYPES_H
> 

Thanks, applied up to here to next, with minor massaging and that new
version of patch 5.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1441e472-9291-dcb7-c155-ab4658ba874a%40siemens.com.
