Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS6A4SBAMGQEXBHKD6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6513452A2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 23:55:07 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id h2sf203532edw.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 15:55:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616453707; cv=pass;
        d=google.com; s=arc-20160816;
        b=k1/rdy+L7NYCVZIQaxJbEv/qf289+faKmzSF7XVO7c3qIwV8RqTptJErPCmYlZ6fzY
         MItyBhGBOY3QqvpAORZIWD4R6smMxPCewg7mg5Bpo2BZIiR2GMysQDgnrkPKcBIcE5ae
         iHHxxt5yT/onu3kPyOqjhmgPpLiJfYGCdq1lTXe2d4CBuohH+HvAohn6u0oNE7eWBXJv
         AwzfVh7y+2cmIqG8ZuDA7SUMB6BnisW7cw9W1+kSpfp6UkyHzRWU7+xPGjOYpKI3kfxo
         8tM8nzCLp6n5LBEQmqPwmktZqX6R5GYr2o8EtiCeNwPezhACaF1IYMzV5z+d/08bvns1
         4Asg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=iVSUmXrnn9iRGFHB42b8ZyexwDD3LnSyvBPopRD/7+U=;
        b=ubCQJCNSWo9l43AYNNgBdMPz0jXYsYpBmtVnZ6/+JLa4AA29y7CPM8U00xUN+EDI5+
         Kqvy3I93IYNxlqZAYGdRjIXYBl7G9ie2FwSAkU3HyeKMGYkRChE5kdIHbs2uEDY76X/z
         KdIQ4hyBkGakKRIg4hMy8p3UK5ANoBtFy2UfHKH6YRP3lAfuPV5zfLN7odeHcGF55uJu
         5CfGZp0BvZMOmCxQa78WzXuQOkFl3Nza56DleNDJX3z+VSoqPsCQvGnFF/5aFa4Ax9cM
         gDkNDqMYhnMn/uyFkApVVTg7JLD4peteyT2n3aENYxkxVoGmos0S+jqqIdferdx0L8Tf
         HsBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iVSUmXrnn9iRGFHB42b8ZyexwDD3LnSyvBPopRD/7+U=;
        b=OfnOJ3chmbLpMnTEiqfgvs78pSE1kc9RGU3ZnxDnFsGUQ+/8MZudLnmN8bonWFjl52
         r45d5xhpYdEKcyH055BhL2uQUjnKC5Bl7dZfEEtpOT60oXcmO9TqqPhOq1sJ9annQ7Hr
         K1UzdTGNyTD9dcGIPs2MqkWEnQXru1qJpysfNc0gk65BEtcM4emLNkauuBaPlQmmSxMS
         KLkHJoVafsdufkX4LDysKoaQ/1mSOdFqOdg7rhvjEXv6ve3oKCM1TDXbx+e2hXXBSwQA
         vElbPlxA7qbPe2lIXPFwmPxg0jK4IevazGYMBfESJdujleiDe+LC61XNHmj5F1xR39U8
         sfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iVSUmXrnn9iRGFHB42b8ZyexwDD3LnSyvBPopRD/7+U=;
        b=LbGQhcsMJv8vFZaCRyimYqb+00o8St9whCawnJyqjkQR8naGFtkOjC5RBMr7SW9USU
         bdeVj55nWOJw+yHu5KWeuyer7HH38me6LlqRtsA0OA5SjmJDhy5iyE7f9tDxbwjgaQXg
         oBQ2Ba35cO1mUzUASEydh9UdD6GtnWEDCTAqTf49uz9lXL+Dh6cOGYZC4bvDZ42e03fY
         fHssnXmYPAJcuL0ppppIMhcHqIK/u4uOsU5jds/PGqxn/AXClpxN8Nvul6VAr37edWa5
         z52++cxw0w2wX39sZDBqriC7USFtJcY6fdJo4WINBnkwdTtbradlMG+FtfB7dcNRbDo/
         M5/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Et3469GeDGOy4x4wCbtXi1FF1pWq4pHA74yUQDsRDgy7SLR6N
	jgXxMblUxZDpG/DbjjN/x74=
X-Google-Smtp-Source: ABdhPJydWdnkfd428fyEJCGniWopq9XmBw3V6d0fUZGHY6Me/TkYc/yWNpdSM+SlNIOGlg/9wL9FfA==
X-Received: by 2002:a17:906:9515:: with SMTP id u21mr2065252ejx.86.1616453707681;
        Mon, 22 Mar 2021 15:55:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d788:: with SMTP id s8ls3309773edq.1.gmail; Mon, 22 Mar
 2021 15:55:06 -0700 (PDT)
X-Received: by 2002:a50:8524:: with SMTP id 33mr1905716edr.110.1616453706655;
        Mon, 22 Mar 2021 15:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616453706; cv=none;
        d=google.com; s=arc-20160816;
        b=d1CfNahPVTkl6bikt/dZkkoHZjuipQ0x9ikLbhrPG44DO9WRY3kqCAnsj74BTNd0mo
         SauzSJ+fOZIsE2JFzsIYBKEHrGdLgIiSp9893RsR2Dz3Aq85T3xB2rENaSlYnz7oG3Yj
         3cpT3JZX/MgPPBw+Rv24yef/+UVXZggUchaRaXmURTyYnoaeLhIN6pPwFK6BQ3OZQG4n
         vyFt6c+HRH3jkM4EfVC6xgK67umi5ZsCOwfq8qRDt+PhHsyz7urnkgjibhohr3M48Qi2
         WJc7oDw0uCMU5BlGbf5xblJlpc4YaFaNUICyCjhr0HxzY87hQPqTM5orRWKC3rIcNlH8
         0MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=sxXVXbYo5iW/3VteUeBtRcKV2OKQh+kwmy1VuiMQxnA=;
        b=DXsIDTlM9gk2wjCZDRbzHAqjWxrUfdkEWWw5FB0GLNnCjL0U6PrzfKc4Jf66zk/vHo
         hKP+Bo1RvOudW9uPnEdAg/SJ1sz4OgC4542WhVy1JUW52/jbL4lfZvpcAuZ1SatAhjjs
         aVZmfsNuI3KdFmrcrkH3D4Yordpe5xqtM+Y6cY1cj/l1li8D1bAcM8INXPsKFoOuEM7F
         23APEI6Qwewxl86O/Yt+hHcSsKRRxLWWB6oX09ot8+C2yo1NoBVNIkUKHY/MX2u93H5h
         CDDb5LZ0sA5TP3eEl5TGQVWbJJXJDee5d0cuqtR6zj6m1kXecgv6q1qMcfCVUq3xYUqZ
         E3Tg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r21si671276ejo.0.2021.03.22.15.55.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 15:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12MMt6aA013696
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Mar 2021 23:55:06 +0100
Received: from [167.87.240.35] ([167.87.240.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12MMo5xh030036;
	Mon, 22 Mar 2021 23:50:05 +0100
Subject: Re: [PATCH v2 0/2] Add configuration files and dts for NXP LS1028ARDB
 platform
To: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>,
        jailhouse-dev@googlegroups.com
References: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <105ac6bc-7144-a0bb-0952-d2e5cc38b861@siemens.com>
Date: Mon, 22 Mar 2021 23:50:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 19.03.21 17:40, Anda-Alexandra Dorneanu wrote:
> Changes in v2:
> - remove overlapping region from root cell configuration file
> - remove gic empty entries from inmate cells configuration files
> 
> Anda-Alexandra Dorneanu (2):
>   configs: arm64: Add support for NXP LS1028ARDB platform
>   configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform
> 
>  configs/arm64/dts/inmate-ls1028a-rdb.dts | 139 ++++++
>  configs/arm64/ls1028a-rdb-inmate-demo.c  | 122 +++++
>  configs/arm64/ls1028a-rdb-linux-demo.c   | 142 ++++++
>  configs/arm64/ls1028a-rdb.c              | 609 +++++++++++++++++++++++
>  4 files changed, 1012 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls1028a-rdb.dts
>  create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
>  create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
>  create mode 100644 configs/arm64/ls1028a-rdb.c
> 

Thanks, applied to 'next'.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/105ac6bc-7144-a0bb-0952-d2e5cc38b861%40siemens.com.
