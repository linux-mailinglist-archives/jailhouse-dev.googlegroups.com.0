Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7VK533QKGQEHUHOKPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB720FCE0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 21:41:52 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id c21sf12218888lfg.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 12:41:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593546112; cv=pass;
        d=google.com; s=arc-20160816;
        b=cwn5e92PRUT9smcWPWbPs5Eh51JQXclw7UgfD1LJ2ZB42wAL5qzQO46BV01U5zCWaB
         ZLmLWQTN0VMK3GbwVBpttNjxMVlLW+YpG44RuIe5uknHqem6HfMoW0QWFGt01GEQAGF4
         w/AfarFf+/TakjrhdIcUNDrRwRQ2DAlEgsg8Xb9l+jWejoQenTYyMYCI5dRiul3kFGZq
         KPr8FjCDjJ1AyHSg9BuadkMcNoMo5Ew91H8p6G6FlZ4uUtZtnDTB6Qa7UBlVfw2JH/hq
         mt6PNF5HrOG9CMJCRtmrRRh8jMYdhbtAwp33ZgNQKwMILxy8hdVOSUrJHRFlLfeCkaqn
         f7zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=QJGqvFJlko0YifXU+PYB2Dn5Ithw1jDtZr3e9QI3LEo=;
        b=bxlu0PI9OQdVT6diVdrbPZqcDRMJqEVUY5AxCfu2SysPqm5ihJAWrqjXmmnoFawq3+
         +9N5ZJ0YBg0c7ICR6fKEpjMNDHNMe9zSfFnrGiU91NVdLHw8Cs8NkeIn9mLwsV7aI3fv
         QC+eSGegsT2pDU5WdxMIebmgTvOJZCUbwCe+2BGOS+qZUTkemSShwk05qEZW0Zhvhn/k
         WLOCQiunhhfArixJNv5SuRiPDAQfML0Na+TClmSG49XeB1dgwSHe9xxq/aKz2CXe7GYv
         Tqx162etsh75ZAPK+OoMxHJe4zU4X0wtOD9fXiar6FB7jt2Tt8z7Hl6SfbEp21JTEmWE
         Cemw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QJGqvFJlko0YifXU+PYB2Dn5Ithw1jDtZr3e9QI3LEo=;
        b=Fwijg07xEmRf4X9nhS7BJ4Uwm77yQat3Lel+ZKmSr3RGHfjNK5eRbT7AOmuZ56CE08
         VtR36hp/b0KFikx6ORa38t+srqIg8/PqvCiZMw3pa4l76w3wrez70h5ACPEGUI56ycYr
         2pgDC2F40j5OFN3IF6Fod9SEFJYgDpQZyqYGFL0eg2u4VMrabbwrjrkyBi3abYnRrizf
         iosj+D0b7geveVo7AyVfxbrAgeLbphFGPPi80U2ISaGg+74LqQN2leGpczkaoLVElwvL
         ntGSStKem35mUem4J4RHev6rhy948yvWVnhFRdC+li4jujEgNgjFkLnSXm0hANwzdkjC
         rhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QJGqvFJlko0YifXU+PYB2Dn5Ithw1jDtZr3e9QI3LEo=;
        b=gvqNVlfwbK9lDglmNefhQGLNoX8Nopj/uflF73sbInFlILhV+OrB7j5Y9lO0L5lzHM
         64hhLG3w+6TQYMYCv4hQmh0SaZIX2yPU1g1grpKiiECl1XvlattNvMm8oI3gwGrBm57X
         d9HJjFro74kkuGFUa92oqjUuty+dOx+UCCxnoXh6Pq1raNB34An9V6zyeOyYBB/Ms2NJ
         31lp3OjTf6mzTtujntsWbaL6kTwj/+yPtq1+grgSFoGPVYIPsLxeKgqizbx1veN681Rb
         cRykkDLcSfX8OT82UhD2yiNzUFo9Avd2uWMlp/95nJdgzqfeCF5ntWTuq6VKh6cNkexm
         zOFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BLKtscsT/O5X0ub6vre1Iq0k1FZ1qAG2aqPInGYI/m+5674df
	686fZhm1P7Diyg3OAgNLQ28=
X-Google-Smtp-Source: ABdhPJw97DvlQ7bzNjSU6Bg0WsB78MWvMpAmPpATQz7O5bht8OdelKvpmX3nhBcTgfpFgyuKCP5pDg==
X-Received: by 2002:a2e:a317:: with SMTP id l23mr11665896lje.175.1593546110624;
        Tue, 30 Jun 2020 12:41:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c188:: with SMTP id r130ls536407lff.2.gmail; Tue, 30 Jun
 2020 12:41:48 -0700 (PDT)
X-Received: by 2002:a05:6402:1605:: with SMTP id f5mr26184372edv.8.1593544194476;
        Tue, 30 Jun 2020 12:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593544194; cv=none;
        d=google.com; s=arc-20160816;
        b=DLSZTItqV6zilRdV0fwUl2GEUPvjbH7aObypTVShruBCbXJvYNqFN2X1HZaEqnW7VT
         eSHOvRPTEyaqHGTSUROdShjoI7JCPYZczfG4zDDd+2LH9mPxfQYjy5rg6JYTVitfiboe
         QKhG4ABuaV8fnhAAUC/jWWjElHYkc3LNDslP1UuoQb9eHyFGV6Mj5/2B/dRIY9yHphYP
         WjdRuRZypZzUX3+gsBAj344QFbTGJtXXGFknqWgAAX0ZL4g2AQDIcgpX9E9GD5A3VeB1
         GTJKj9BtclBcBFkgPhMsJpfqOV0VYv+vhgx9opL/S6GzsqgI8SPNR7WlaFSWHLZj55CY
         xjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=gJpipz2NnfW582SkXqwzuYIjt9cj9gsxLnmbQfsYcRE=;
        b=uG7rzybcFQfAQEuAeoAjx5u9plvHioq/T7oM0vLWkyk4T6ADgWa10hGd+Ddytdmx0B
         mT2y/zZopQtT1e9II2niChqkR6sY7o0DuQ8wB3tQC4azOp7JIXFshki5pO5jCbBQRpxx
         lal34fMRavxsuYEAssag5OxDyRlh17cxL9T9PtYnvMBks+PVerHh6gg0FIhiXGbUjewj
         okX0SLfwZiUx5V65GSLdPD87kOx70ZfU/AtMxbtUXA77PtYnnNvB+dLlxhpuYCPKm07F
         ER8cGjKyFqY5rkX/iNdU0fHCdcL45gHx4s/fGlCqBIgK6QtpPidw04n/YuMfAntlB4Rz
         zDEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x14si255024edq.2.2020.06.30.12.09.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 12:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 05UJ9rFN013406
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jun 2020 21:09:54 +0200
Received: from [167.87.7.177] ([167.87.7.177])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05UJ9qsU025018;
	Tue, 30 Jun 2020 21:09:53 +0200
Subject: Re: question on the none-root linux cell
To: dd <497738387@qq.com>, jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <tencent_D38521D0EAF45A05AC09EC0451BFDF16EF06@qq.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <646aafb2-5230-fead-cacd-2affde6d6a26@siemens.com>
Date: Tue, 30 Jun 2020 21:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <tencent_D38521D0EAF45A05AC09EC0451BFDF16EF06@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 30.06.20 16:07, dd wrote:
> Hi!
> I have met some problem in the none-root linux cell.I want some advices.
> I use the images from jailhouse-images repo on rpi4.
> I want to run some scripts in the second linux cell.But i found that 
> there is no space to store these scripts.
> So i want to use NFS in the second cell to connect the root cell.
> I build the rootfs myself and replace the rootfs supported by 
> jailhouse-images repo.
> But I can't boot it.
> And then i unzip the rootfs.cpio supported by jailhouse-images repo.
> And add some files ,after that i rezip the rootfs.But i can't boot it 
> either.
> Can you give me some advices to solve my problem.
> Thank you very much.

Hard to guess from the distance. If you really only add few bytes (that 
scripts), it should work. If the image grows significantly, the 
preconfigured RAM for the non-root cell /may/ be too small.

What is the output from the non-root cell booting?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/646aafb2-5230-fead-cacd-2affde6d6a26%40siemens.com.
