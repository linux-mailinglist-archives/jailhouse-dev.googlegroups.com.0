Return-Path: <jailhouse-dev+bncBAABBYFUSWMQMGQETAOOG2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3e.google.com (mail-oa1-x3e.google.com [IPv6:2001:4860:4864:20::3e])
	by mail.lfdr.de (Postfix) with ESMTPS id C558F5BB682
	for <lists+jailhouse-dev@lfdr.de>; Sat, 17 Sep 2022 07:25:54 +0200 (CEST)
Received: by mail-oa1-x3e.google.com with SMTP id 586e51a60fabf-11eadf59e50sf12068264fac.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 16 Sep 2022 22:25:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1663392353; cv=pass;
        d=google.com; s=arc-20160816;
        b=IeZNmHHpYLQgQhy7iyUsB4ECGi1YX1qxeAlgmLlmSJhQCA5qO/hf9vmms8igS2U/hb
         SOaSMlMn12emA3dstoXPP6jE600D1aeDKETsVpxOF09FeZk+LwSkdl5DEQ1EGIAbWFzb
         2jRl4/OpRGpGbsJ0Zm9JCAsHdJtsyAuvjj5NHfNqJEm0/+2dekUXViJ9IjXlbmyNEuoL
         +/VJ5gG1UOkS0iWKLZ47zhpO9WWRKEa/KD4LU3EEQt4WCh3EIJKZ11U8CLCARS0iI2wW
         rHy51awEbV/DnA6YtkdYBxXT8WfOyE8BgZnUsmFGr/5GgKaMsTwlcIIt3Lo3k+YSf1CZ
         1sPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=6goHWifE3yQvfI8fd3tPXa/wl64pt+2mHaT2pVsOKcU=;
        b=EfHiW+5IVF04r67JfR0jRoGmYdKkYxBgoBg+iELFTdlQDFmwqXYXNk33mpCbI0fX18
         /axulhC62EI9pyYByKsriSbph2AD7DTWxTMMvEiI3SbqHKtFlotKcmkaQOnSaWt+LzWF
         WA57dM6wejgEkUP31td6I7SF+SGIx//A0s++APMaG3M7YtS//A7K9nhZgJE1v/plNX92
         J5fBZqIzpK9XrgnjHI9bvPV1Y0V0xi9xCEN2bqYmVoF23afzs1zCGbtt5LyO6aFAYyIo
         I5ObJMuAbfQz5tTdUS+jOrV1GBE3rVO6KToab3h0TAHrm1185KKUyijGKuDjUql4sfXT
         1igA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as permitted sender) smtp.mailfrom=srivatsa@csail.mit.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csail.mit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :from:to:cc:subject:date;
        bh=6goHWifE3yQvfI8fd3tPXa/wl64pt+2mHaT2pVsOKcU=;
        b=bBrh9SYqM2SHrajx5YA9JdprQ+8FujQzG6gldn/05wqx6Tut1yJOsrFGq9VkLvnEOb
         M8EtVEzF9YoKxnUC/qIIg7ErHJLLfj9Q1XJXSK2KiiXVAXBQJMCXTauhBwDauOAbWw8U
         JmnywFLQ4CS/f/JWy+TMI6vTinUsmT4NknfYwaCECvCKvKvv3twcFg8tueAtkY90Qsy5
         KOm+JOivDm9DdJhqsth9uXpwaORjxdsM4AX9fRr9V1Hm7qUkE4yBMQC3kfDnq7p/0X9k
         6iU5zJRAmMWoaCZGyxsocKZkRrTjKlkyFoa8JZveEWjiVaAu/dd8HxAc8AbKEa5VW+oT
         lX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:x-gm-message-state:sender
         :from:to:cc:subject:date;
        bh=6goHWifE3yQvfI8fd3tPXa/wl64pt+2mHaT2pVsOKcU=;
        b=N9chlFvE0/wkmXFbNpPEAXgW+EGSrc35OHebt9d204Vev3Ffjr497Avy8ZLxtgWi6J
         BC5vbTvAvgwXRDrGkXd07dz2zsucf/JHzcL4Y7y+cuFQIMuOSyeRT0vS7PGhwD8b9MgD
         oMwIK2GsBtaQIkTTahVxHsyMrALAm+B6rFaryHpTCSSZjgGU3pPzmk0JCYleoyK9GOxj
         UfdF+64C24DY2frGWW/phWx8hESr1OoNjW42XFJSwq/oLkxcE04t6AkJrLmAtrc1y2q+
         ebmBJZP6Zcxxm24Fl76wzXr6+plRy0dvl0zkevl+FSQmzCgmEkrCdQYbl3yvOjIVCafx
         ybfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0C4A0GIiAorA7Ujz/k+ooc5plyho6mGqtEiN2rNOInd6hMYhMD
	OVGx5dCbGNsJdclhq1WR9uY=
X-Google-Smtp-Source: AMsMyM6p64L08QuUAzUXdRPTQmsCQJ5/wDazOux15F3a6gZKi3HIRjRY/lDQSKDcyzi0Qx59IHyDQQ==
X-Received: by 2002:a05:6830:2691:b0:659:ef98:c003 with SMTP id l17-20020a056830269100b00659ef98c003mr662462otu.365.1663392352877;
        Fri, 16 Sep 2022 22:25:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:37c1:0:b0:350:2876:391d with SMTP id e184-20020aca37c1000000b003502876391dls381130oia.0.-pod-prod-gmail;
 Fri, 16 Sep 2022 22:25:51 -0700 (PDT)
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id be26-20020a056808219a00b00344e94aec43mr8229654oib.205.1663392351809;
        Fri, 16 Sep 2022 22:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663392351; cv=none;
        d=google.com; s=arc-20160816;
        b=SM8rVHXCXeLRNtT9xkBC1WacC7wLGnzU8CT7yf9f6Ixjg9ywPl/Eo6e5jNqdHqEcbY
         bOSQoBZVMRW3eKDdu17w1APtPR9oWux4uJdCLzC3TqXphHIndm/pop+hvVRi7f+KHo3E
         urYrUexKmsrlhYDZreykmteZ+i0BJSUg5mIdWgZco5MILPbwlCVtW+lnjSSXLzv4vQ+8
         1lB8ixdPwwW7EJqA2VYt+oTO3F8U04XvGElqtl24ixMJ2b4UFGlP85BJ0RyWDeUcap7T
         rfaiQWK1Ipm89j+FC9541GF/jXS9lp8eol86/r5f1q/Bzr3eJWjpi0qTkHfaq1grBwt0
         1+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=7LGr+3OiyajX4WyoEEJVcDZ4keU2X5EAyK4bALq89vU=;
        b=Wbj/BxT9pl6FkKJjNppvmaXQLuodPxEuVUk+5qyWUs2LBMVYZTytCgi3zdng4VoQab
         NAK5Sm73gYLenGSe9l/j3PAXYt2JzymAptzHDToKqf01P8Chpcm8FH3evOD2cWCq6QdV
         0axPoTJThZcWG6/3BwRw6hitakySlmiXTWlpyfMxxox91kkAgp5f8J4sOv3WaaCGpHM1
         ORW3YgoCdQ8L6+I6ea8q9OvGpRtcWsq8tV/NwHgIF84bUqs6/+ZthBl/1Hr5SXns9TvY
         ccuK5C1V6cWyl+mWzVB0uWzTOry6tegj3JUi0q1rrgGObx5gGst4ZjmwEiD1AmXGjuv2
         /41w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as permitted sender) smtp.mailfrom=srivatsa@csail.mit.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csail.mit.edu
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu. [128.30.2.78])
        by gmr-mx.google.com with ESMTPS id k67-20020aca3d46000000b0034480be185csi910505oia.4.2022.09.16.22.25.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 22:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as permitted sender) client-ip=128.30.2.78;
Received: from c-24-17-218-140.hsd1.wa.comcast.net ([24.17.218.140] helo=srivatsab-a02.vmware.com)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1oZQKc-001ohd-JP;
	Sat, 17 Sep 2022 01:25:34 -0400
Subject: Re: [PATCH v2] jailhouse: Hold reference returned from of_find_xxx
 API
To: Liang He <windhl@126.com>, jgross@suse.com,
 virtualization@lists.linux-foundation.org
Cc: wangkelin2023@163.com, jailhouse-dev@googlegroups.com,
 mark.rutland@arm.com, jan.kiszka@siemens.com, andy.shevchenko@gmail.com,
 robh+dt@kernel.org, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20220916090051.4096328-1-windhl@126.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <0069849b-e6c7-5c9b-4b52-5aa6e4a328e4@csail.mit.edu>
Date: Fri, 16 Sep 2022 22:25:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220916090051.4096328-1-windhl@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: srivatsa@csail.mit.edu
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of srivatsa@csail.mit.edu designates 128.30.2.78 as
 permitted sender) smtp.mailfrom=srivatsa@csail.mit.edu;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=csail.mit.edu
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

[ Adding author and reviewers of commit 63338a38db95 again ]

On 9/16/22 2:00 AM, Liang He wrote:
> In jailhouse_paravirt(), we should hold the reference returned from
> of_find_compatible_node() which has increased the refcount and then
> call of_node_put() with it when done.
> 
> Fixes: 63338a38db95 ("jailhouse: Provide detection for non-x86 systems")
> Signed-off-by: Liang He <windhl@126.com>
> Co-developed-by: Kelin Wang <wangkelin2023@163.com>
> Signed-off-by: Kelin Wang <wangkelin2023@163.com>

Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

> ---
> 
>  v2: use proper return type not the 'np' pointer
> 
>  include/linux/hypervisor.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/hypervisor.h b/include/linux/hypervisor.h
> index 9efbc54e35e5..f11eec57ea63 100644
> --- a/include/linux/hypervisor.h
> +++ b/include/linux/hypervisor.h
> @@ -27,7 +27,11 @@ static inline void hypervisor_pin_vcpu(int cpu)
>  
>  static inline bool jailhouse_paravirt(void)
>  {
> -	return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +	struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +
> +	of_node_put(np);
> +
> +	return np ? true : false;
>  }
>  
>  #endif /* !CONFIG_X86 */
>

Regards,
Srivatsa
VMware Photon OS

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0069849b-e6c7-5c9b-4b52-5aa6e4a328e4%40csail.mit.edu.
