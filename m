Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOWA5XWAKGQEW3BE62Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547BCE870
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 17:56:43 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id k67sf13074wmf.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 08:56:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570463802; cv=pass;
        d=google.com; s=arc-20160816;
        b=rpvFE2I5gFGnFe9t/7YLIhLC1gP3vS92Tzoz6p805JQcziLznoCmv2REJ9ozYEbxc5
         GERK+7Z12IDvOzgYLJf3Os/avQzeD0VQ3rUbO9QXgX8Xy7kapL2vT/eHTqEFk9FqS9aP
         mocRjlyt7dGh8dDwVSRBvQ4aRmgWxVwtm1LKjv57w5Cq0V8+5Xi2MP1gGa9CYEw7EEoE
         p5BDISkfXsEFvrTJ2D/cYgmFL3nZD23InJeoQU5YeaTIsq0VslK2Srgta3cuH9SamHEI
         DZdCW7d541li/8z+K7TYeIXYIbbfqOEym9RJxJdm4dto5xzyv+EJeWUP9059W1v8yaCx
         N9sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ZV787MsTdc3beJHNh9DdSfgKd47nF3cOQtT03TUbsEY=;
        b=zCA9CJXBuiVxvDzCG+y5GrgHvAYvLOaDrfeVck9hHswSqICShMIfwqWwE54eE4hzSI
         nPPJJyPeicX2A6vswIXpfCq5tJF4oleKoDAJ9z4y8/AmYEcQwzVzr+sCyBw+nZTuTWip
         awMAv3HgBEjsnUn9GHWjMOwjm0KOSnhLkve1/WpjSJaVctOXOZgJFVM0HjxSszPomhe5
         LFEBwFWdh1IjB9RwUiKemsbLFfWNhf5OiAoJvPIgOAmrE2B8+FIOHbOVTK6vRQ233o22
         K8UxjiA2kymqzy5qPZlUvrEwNUneUOtkib0cCgTG4h9o0Nr4yxF14XQHAV0w/Vmz8PD+
         vXnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZV787MsTdc3beJHNh9DdSfgKd47nF3cOQtT03TUbsEY=;
        b=WcFCIbpIAL1tF0mK+3VYXhdWAgZBGEg1vWwwY/rjnF52r6Myt+Z1Pyt122MXh34+TS
         Ft7Yt/Z/Y7UphLmz1kDHCvGuqbzZL4tqT2v79U8x+c8lQPxYeowKsE45t+bCWxvNJ+fc
         t80iW8aTOi/VLVs910IZTBJjblhr+gSXfXtS6idzRCjlJWb1+bHuvHLu7A3DZRUqUfYZ
         RVRmVeQRNbfQLcKw5lHSRSweZAPnne1d78KlIWgd7fHvsBNLs7GY46yRWjSIQGCpzuzh
         0iK6qHNN7i4+ued+IyDZipZBPuhrm3lqRmZnrEUSJAKK1y2U2LX2TCNYByzymuvKfbz7
         d6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZV787MsTdc3beJHNh9DdSfgKd47nF3cOQtT03TUbsEY=;
        b=Sc69YHijStUxcIMfEiRG/S/5mEPh1SMTWflIDKJ6vDdQzkfwcoKpHzERxwNgORv7gj
         sreJCsymAr0RsycnnlOR3hBU3P1N9H43Yj2Gsl4s+SsYYYp89/JTCaTwjeNMWKWjj0T6
         WOBW8GMeekzxj0WM2vdGmTHSE07hc3b3T0nXpkCWmqAtwW6DLTr+IIdW7q/fYt42lhuG
         tWt9yY0SCerF/jp9u2o2YBDcEUB6NbmIZhITY+ZMky7rcQKc8jJZNMqpCihJG5lAe60k
         xccEKUbdTLT8/q4WBbpjp4ebJ0EBMDruTjkYqUJBALJsdn6hmpOPEW8SpM1nXDqgSAMQ
         3JaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWe87mombJ2AwpFIeKM0yGyhZM+4KoGj4HYMhwe8l7fzuzwOZkA
	+PUAWDIJq1ptIthE4gRpWnQ=
X-Google-Smtp-Source: APXvYqxM8PcUFm0qfO11Ly/c6ylLLBhajtvUAkV/lh25e8g1VqJcWnvBha+iB6ZcPkIArLErVuoHgg==
X-Received: by 2002:a5d:6a06:: with SMTP id m6mr22854151wru.190.1570463802828;
        Mon, 07 Oct 2019 08:56:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db07:: with SMTP id s7ls48974wri.6.gmail; Mon, 07 Oct
 2019 08:56:42 -0700 (PDT)
X-Received: by 2002:adf:cd81:: with SMTP id q1mr13488834wrj.185.1570463802063;
        Mon, 07 Oct 2019 08:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570463802; cv=none;
        d=google.com; s=arc-20160816;
        b=u3YOtIiQLxUddxBj44UqH0drU5NyX0Iz+qv6kmtb1mOTd6+ky0D/RxAcCyqxi0GEbe
         SDrAJ4xx+6tLt2W8gU/FhsaW4DiBMcea8KO0EjsSFVAMEwXUHQ32xvcZ8S4QVeVQpnUs
         Z1BqudcOwduPFHpXwTfk2cinT93Hvt2bshpuwHlgYcUeypgABoQFmi7VgHPtWI934v1G
         uBfgCARDCaVPOnhKki4dvP3PiJqbUAkyLn8wd0flURl/bpBF548zxC1P+g+7IYnMzm0R
         A5sMjvtKW8oN1Uww3I7u23eg+RrlSQDelUzk1X0fKCE/IuKGiX/90Jr+kP52x2PGGpGV
         Vj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=5nWPgY/nNRfiIKxis8LySpgfa4844dQLYfvWAikSKN0=;
        b=yQdalnm7X0ZOVmlt8+Jgn63gWC2PVRUKoalnuiXMwe/9BiW9V4uvnUjnVTuB2Bj+Ky
         B8YaDkRmMBVSp67l9qlT2QuBkAW+BAkTnIp+HbHbiTLX2kCHXWSCx5QzP1BCLKZkwTWO
         wDgA2I5wD5C4BuCnFPNJRPEc/5lkPNsYxzvEafFaBqh6NOYuZaqEBQ0Ets8WIyp4zZ8f
         meSaalPl1SixbT9SrXuFcYN4D5MstEvxV7fI/a4ucSv6OHiG6XLLi0vVGLrdBCubRyl3
         EJSNWaCnqOvBkX/8HmC51BgJSQIOyOjylYsQvJT+x+OlGgarQWuuOmZ8htgniUqqCC4+
         uMxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q185si739wme.1.2019.10.07.08.56.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 08:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x97Fufwk029817
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 17:56:41 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97FufoX023666;
	Mon, 7 Oct 2019 17:56:41 +0200
Subject: Re: [PATCH v3 03/14] pyjailhouse: sysfs_parser: remove dead code
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-4-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2bbcdc0e-40f6-86bf-cae3-61e9ce00bb75@siemens.com>
Date: Mon, 7 Oct 2019 17:56:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-4-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 30.09.19 21:13, Andrej Utz wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> There are no callers of __str__. Remove it. Seems to be a development
> artifact of earlier versions.

How did you validate this?

> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 67dc85d0..f65eacc8 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -831,17 +831,6 @@ class IOMemRegionTree:
>          self.parent = None
>          self.children = []
>  
> -    def __str__(self):
> -        s = ''
> -        if (self.region):
> -            s = (' ' * (self.level - 1)) + str(self.region)
> -            if self.parent and self.parent.region:
> -                s += ' --> ' + self.parent.region.typestr
> -            s += '\n'
> -        for c in self.children:
> -            s += str(c)
> -        return s
> -
>      def regions_split_by_kernel(self):
>          kernel = [x for x in self.children if
>                    x.region.typestr.startswith('Kernel ')]
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2bbcdc0e-40f6-86bf-cae3-61e9ce00bb75%40siemens.com.
