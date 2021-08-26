Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDFOT2EQMGQEKHHZFPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 068CD3F88F1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 15:28:50 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id s8-20020a508dc8000000b003c19f7fe952sf1523386edh.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 06:28:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629984524; cv=pass;
        d=google.com; s=arc-20160816;
        b=vxcg9KAD4sOVINKm4tEVkypn0uZ75IVHdjqP1+/KuqPlHSfHAwdFwv0IQwIpTRQIhA
         dtYSoJe9CvFbX80dKnr9PWMxF5DVWIrwR5UL1G6csX+eLbRpHbprr1eegQzBNjRy5WC8
         u57MyOwSKHHGqWG0V4k3A9X+vqzL/NZ6/K2qHqwKJrvaqhnZoCx2VajjFDyKjMUXyCjW
         4B62h4TMX+txzNClgGbDsToEqTy7Q02hpanyeS0tdJiHF4jtff7kxAh0x/ybtlqIQcf3
         lSiY7sW1X4sIgeQh44zPd86ycY0PHhUGCaPqKIMgwpkbOEG3Tbfp7aACLkQA6hTWldbE
         0q/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=4+M0TSnE1DL9FZsjKjGB9eVmVULfrwnDKfI35Lf9J7w=;
        b=0Arlp2sHJ4ZELVtN0QAbzHVZsL6vLy76qp1ZE5laxUprCXjTLppHiWUfD+BSDNKori
         CDwT4hxq4vcj47sILVQ/z3mfmYHEnS6UzuRXRx+rKbd8Xtk+ONpPV0WK+FGXmP8FQOQs
         CuZnE4Qmqk4Lw14HZRJo4PGFwiFrcAtp9h9rTipSaPZAWlqkaSbAimgyk0qG9zwe02dn
         uQcJ/5qvIDsON2pljTWt2yINMocs0qd4g/DN9/7oJwWDnJHtj7GP67s8GXL++7tiRabb
         NcA8FRElGmmrafOpABp5k79J4IDmjKyzVDhWvP0VY8HC6yQzPIXDXv9dMqU9JOXL+rnw
         PwpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4+M0TSnE1DL9FZsjKjGB9eVmVULfrwnDKfI35Lf9J7w=;
        b=e+nrzlEcvO+OtkILw0rzv+MUzU3X5IUN4XucrcogoqNEQbcwFktM9sg+ieDynStE8S
         IGe4TLHA4q3eJWJXCa1pphC2GdI9mkiletpVOQwB7HImEDPhGIg2Hb0Ou6awMy8tH6v2
         3kJVtUxaYjkyJUawR/tvmiCjOm365gu7L5GMP3/owFH5ofCSAz1hY1LCYbNuot23r2yv
         UlL9z2EWe0jL8qwoT2niq9rhaHQw+tWTnCQnGjMlu6uzgoYOhWGRjRo+EuGUQRJhUMKo
         6LU0JEhvBJQqODmQPLg3/ZdChc23QcoWZoxJfqWMMrFJDAQHxBX/9zq5RKVt6Eco1Cn/
         fAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4+M0TSnE1DL9FZsjKjGB9eVmVULfrwnDKfI35Lf9J7w=;
        b=KtcYNRIPxqNXMQW7CaIzGW5j4kep96P4uT/u8BYoCH5iL3LXnaXycl1fv22qpIstJk
         kmyzeBPCOsjhcWpdfoOrC9BuFjC6qsAhlrcNU64a9DGF/iNUvb/k+3B8f77blL3cKPoN
         KBXM5mHcD7U+poaPlZ10wWDOiT2irZHU3PwHPZp5P4WdkhRp+3oO5+R30F3vmy0+/cHF
         q+MRUYG9ndK6eMrqz6zXnCZTy0w5QuXa+XBu+8+PnMY/Kb9voJPTPXUV12NrQb3yVtwO
         o3qT2biYevoYEYIKWaKsNyHeF1rX/TXrkvLP8FEO+BPb2QF+8sQzixJUSewGNZn42bot
         WPwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531E6RcPiPf50YDUn5G3A2cugIelq2Se0Z8BOZR9WMxqbWvebByG
	jPkhfud7t3xfSsNyeqMB8JM=
X-Google-Smtp-Source: ABdhPJwRtZow1QEJMvqPRGwlW8T1Moeh7o7tWghr/LKKDgiJiMN0wtgPGJvix1z3XSLNXpi43n3Iow==
X-Received: by 2002:aa7:c70c:: with SMTP id i12mr4286120edq.256.1629984524756;
        Thu, 26 Aug 2021 06:28:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:35c9:: with SMTP id p9ls2847497ejb.0.gmail; Thu, 26
 Aug 2021 06:28:43 -0700 (PDT)
X-Received: by 2002:a17:906:b094:: with SMTP id x20mr4262897ejy.257.1629984523497;
        Thu, 26 Aug 2021 06:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984523; cv=none;
        d=google.com; s=arc-20160816;
        b=zOfUvalCa84ej4/x4YXdRrM+GNUWdjage35sE9jfsqlxOeSE+7z6xMS9yvZAdTlWso
         vk7ysUSKK52FxuNTiv/8ulQzYZDn5WNLKHDpDVT4FzOxxUUrveTzuPtrzL49U2M/cNiw
         yDAUaYj070ebQLSQjUmwIL7kVYKO3FuElMcT5I4KduqrXYSE3HTfMnJqYW0y84b0KOK0
         qkUK1/GH4xsiNPsV8I+gce7IjU9vhdH6ngg3paY6CEihvRmC54NNhGST8oYeL1Z3Rz8m
         9LRRB5aR0mzn1PqPdoiAGgLucc2NzCsvS4Iwbva/EZfD9hIz0WmcZCt6R7NFblY7cia/
         Nckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Et7+attuyvvHUIMWNEPGcstWNb3zmvPEIybf1VINnCg=;
        b=CQZhuO7SQQsK/leGcsv+uZbeJrEqunO4X0G6D4wH4xUyJl5LbcnGsjVJ5+4RilW1eo
         u7d1iIfrgBVQD9OPBxA5cpRnlQzPUF5BvnmSpZDu50xIYMsKj83bvH5jaZbhM4jT7TVh
         vD44ERA4ZVW9G2fa/CMGUZsr/P43Mei++DOsqHRFRn6vs6kr1A5pmQSAlKFdhW9CmT0H
         VI3OIuJTOIp5oaUh0Q4k1W8HRT9kywT8+z3P0Xu9ibi2zyWMUQSpHmZqSDIuFfka/KFY
         OFs3+BSvbkBdNxw2VDi2QAsJEcLPf1OEvcVYREg0aRdlOdYlj1Z8qPsVfj7QD1+P6b73
         vpTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z12si165468edq.1.2021.08.26.06.28.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 06:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 17QDSg7e004320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Aug 2021 15:28:42 +0200
Received: from [167.87.32.3] ([167.87.32.3])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17QDSfZh012728;
	Thu, 26 Aug 2021 15:28:42 +0200
Subject: Re: No need to add spin_loc() and spin_unlock() for cpu_public -
 cpu_suspended
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <CABSBigRew4uS4Hg2QAvRgLJM3MvV60ff3E1wvsv+U52u-MYTbA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e6df60db-8a0c-a0e6-7880-547edbcf1c6d@siemens.com>
Date: Thu, 26 Aug 2021 15:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABSBigRew4uS4Hg2QAvRgLJM3MvV60ff3E1wvsv+U52u-MYTbA@mail.gmail.com>
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

On 26.08.21 11:40, Dongjiu Geng wrote:
> Hi,
>      I see  cpu_public->cpu_suspended is protected by spinlock,  but I
> see there is no concurrency problem for the cpu_public->cpu_suspended.
>  check_events() is the only place to change cpu_public->cpu_suspended
> variable=EF=BC=8C other CPU can not change is variable, also  check_event=
s()
> is
> not preempted in the current CPU, because IRQ is masked in the current
> CPU.  So there is no need to add spin_lock for
> cpu_public->cpu_suspended variable.
>=20

The lock protects (among other things) the consistent view on and
modifications of suspend_cpu and cpu_suspended. You have on CPU setting
suspend_cpu as a request and another CPU being the target, evaluating it
and setting cpu_suspended when actually having reached that state.

You can't remove the lock without risking racing between the two CPUs.
Maybe not all of them will lead to inconsistent states, but some can,
and arguing that those will not happen in reality is much harder (if
possible at all) than placing these locks here.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e6df60db-8a0c-a0e6-7880-547edbcf1c6d%40siemens.com.
