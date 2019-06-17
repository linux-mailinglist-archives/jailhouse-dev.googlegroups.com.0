Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHUMTXUAKGQETUBKGLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7747B98
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 09:49:50 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id h7sf168299ljk.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 00:49:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560757790; cv=pass;
        d=google.com; s=arc-20160816;
        b=UBvpGwxpwdgyMqJVQ+rJu0tf8DQw3jqbkaNK1hGriu46C+7AjKhu3+B1lfiMG/dD8h
         hUaBaDFbw38IL0+LATeGScW+XNuoumUVEUtMoXFZqw9WCBrgjceqkxOJEQ29ia7uaGhG
         qoQdH1ffh53vboRpjmweYKc88lWaEhWJ6OLGm210gLTtSaA8yPDJ8KuKsELIbs9j9aUi
         CWeJQJjmA2CnYA4qjuRGjssggfkB0ddFUYxqqkk6nit/xwEwpt4vVkL6sfawS9eolfBi
         PDkrTaKaw9ZUyNTapv69LmuoM9DOGhcvuA0Zjz18aPay2y8vSCX7noQVxJT/MmPHOcsB
         zWOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=IXHUUdpvkHNcoUmGrCVURJXWuuBI0x31GdD4xd+rmto=;
        b=GpjynBYH9Hk4cLXLr3FQrDX2dZWmVe7MICcYiyuT6i2Nor7RZpYJwP5j+WbOtEExk2
         IA+UrNVP/o/ntRBwJ65BP4Jh1icHOp8cer/k8u7Pv7NLIgwz0aFvECO1rvp1kzqXRSpo
         caks/pJgEiaD0SUS8VhgS9lqBUdk9rqwq88Hsl8Mmi/udptq2R3flxNSu+Z+C5y0tchc
         h5q0bUQNCMZPMPMGw5Ix+ZXnxQL/9AM5tBRJchjbkb1VNG+Sm/r1ZXBDYbkDFSWg4kfI
         LEbk661SE71YDF/NsRKPF5UcZZgEgLw5PMLYf5prqRcY5/riOt5iPFXS08gISS6NGseJ
         iepQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IXHUUdpvkHNcoUmGrCVURJXWuuBI0x31GdD4xd+rmto=;
        b=TW7OfqiTDfA/mFR5tCrDOs7WKni9eAXf3p83GD8R7G8xytJtX1CKh95mXpSgSwBvot
         kySMmK6tGaQRH0z69iqfoPWRffeFdcsezwcM8ORTcVfexdzkrc02IPP6eic2YZDhnJjY
         52WCfqqLV0+nMV/muVpKcFFPu8M9BKgOWm02LJal2frCliKgKYroLAmJV2UTLJdkIfJA
         cfAv2RaVJ80rSjYE8+Oucr4XHJX18NsDL0acyl+2wWBOWZSfSuSacVOjcQcIUIqZ5usn
         KLf4Tf6BsYcl3CfdObbxxXA9gzvJXHmWnJ8wdT1T6GBNKp8OxhwMamMAkzOw1UAUY//A
         1H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IXHUUdpvkHNcoUmGrCVURJXWuuBI0x31GdD4xd+rmto=;
        b=UguP+BgfehUuaSufG47WpJt3AyZFDkbQvNzUNr3EhSDvFnJh8GJRLhGQHTAu6O1DKA
         iffve0ik4WLv5jTeedhhoowEs0qC43k4Nt7JmQ8Ym0usxARiyE+n4AruQ9hr2oVy9tzQ
         lfEag1RIvdSYpww9EiB5V9zn94MlpKHzmPPzih6A/ltliUqF6U+0mC7cv4IJ/sqhSeNy
         uYOh7MfKQGe6K+ct4rgAWk+g9twaQ7/ORlLD4V8zGS4NJlMHKTKP7ve6N8rMoUcAwcgm
         OZMcIxlqVlitscYJpLlO5ZYTQQROnn2ev8sDgdytE1FYCcDTGmMiuOqUN6b5sAvKDksR
         0NuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVB8GnUxUK2CKOyaZgxqgtDTIkwIIbtNVMKC5V/KJsmYAa14UOf
	IQjuKiv0FDGcILr/pmRctNw=
X-Google-Smtp-Source: APXvYqz8Jic6nmcrfVI7ljUD7PiP7Tt8/lNYoGubg9s3hzoxVWUHJBroUXR/Tk0hCB0r6p11AsGttQ==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr13648306ljk.106.1560757790140;
        Mon, 17 Jun 2019 00:49:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7f09:: with SMTP id a9ls1731400ljd.16.gmail; Mon, 17 Jun
 2019 00:49:49 -0700 (PDT)
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr26083514ljm.69.1560757789465;
        Mon, 17 Jun 2019 00:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560757789; cv=none;
        d=google.com; s=arc-20160816;
        b=R5Um8NAKMhf8yI/Eg4nmcO3ze3eUJIDAPtgbZIJJpPOIBmq9cJOqHmAxOTix/W9zxT
         zQepSJqeSXbKEC6nfUJmpD5Gr2ndOKv5LEW2a4N24SYbu23qWV/JQlpwgzlpwM6cnr9V
         EvPRwb6/JBwUKyV7tyFxMQc6HV74qdO2rosg7lop7BdFdcTY1mbVZpEKKGGhEah2KsLl
         key+2qX8vZpwtYAxtKvOfLJ/ZwY4JJEVIiodMxsOPlaKaEHyLFC4720vCK3CSGyRhA1t
         oySHRAFLfck4ep2uHO3Ds51yx8xQ3EI9NhBAVGP/jRHPaj/9ELFMxTSfcUPQcIqn5MER
         fAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=gnVLgoyt7imhdEvToK62+2/SgjfYCj739yEjGXIx9Vs=;
        b=t6U0hMJmZ5Pq+TuNpKBpsVvQBpnlr3PxdAA2SNPiEz2TtU7xT2lmayclzmcD5nkBui
         hZq5yfaMqHt2AxUyYpR5AXtphtUsNanfkbdhIDKGCE41z4DN5dP87aobP4uGiSIDT+sj
         jeKis9pOIkh5xSb456VzhBICgkYBlwhdSoSSkFahpDc6qe9qX6LO84WDP+a9C1iVRjJc
         wmvZjSspIxROPVt7kQBolvqa0CTDtQt4zPCZCnMwDEIyVQujkWFLjoDZEyD221D3FtZs
         aN2InjBOUuqU6iKFHBxYzgyai1LIuSCI+JbVjZIUpnsntV0m2rfT8pNe0j1nAOBccE4D
         BHFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p85si47813ljp.4.2019.06.17.00.49.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 00:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5H7nmxI019387
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Jun 2019 09:49:48 +0200
Received: from [167.87.8.104] ([167.87.8.104])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5H7nmtn023442
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Jun 2019 09:49:48 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Finalizing 0.11
Message-ID: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
Date: Mon, 17 Jun 2019 09:49:48 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Hi all,

by the end of this week, I'd like to tag a new release. If you have anything 
pending that should be included, make sure to post it soon. My integration queue 
is empty, so also let me know if I missed something.

After that release, a major rework of ivshmem device is scheduled. A prototype 
that supports multiple peers and has other optimizations of the previous 
"ivshmem2" approach is almost ready, just needs patch queue refactoring.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
