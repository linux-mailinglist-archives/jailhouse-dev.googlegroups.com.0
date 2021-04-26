Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRUXTSCAMGQEDL6QX7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626F36B965
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 20:51:51 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id 88-20020adf95610000b029010758d8d7e2sf7827977wrs.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 11:51:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619463111; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZOVGFpxk7YSSuwt8fNRsUVdxTNRV6ouzDeqQNdXl7iOMByMRMrMkRPLRHd2+lW10aw
         beUAG0cNo7/Rz5LIwkIyVLbQIjwIU3+s6Tq6oIAIJ6FqAE1Y06frDAeA44vf2iqNkKxH
         HADor7jOPMfI2b/ZQ+kXd1A1Lzu6FyImIB/xZk1i+g+u0M3/REi47EQ+pEqzxfSLfcl9
         fI6cWFrAGbAO1QpIt7my2T9S1T/O6d/6fW5sJBjMx4hwnJppziePk7imm6L9UTumGqog
         A8R2NGpqDLz6Ormj22BM0fyBPYMayGDCaFpRF4ivCkeV5LgFqJChyhWV46+NIGS9tA5c
         zAww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=h0FGog411UEPGxji/Cg5jpgMEim9v09uk8ZM7PGAUFI=;
        b=R1EXXk/azlW7SoKekNyVj/fPi7J2F9GsOImDYBbNoaEZxeDaE21kpOeaQf2TmmYa5I
         Ea/Z2TsknIzFmlwc69ofjQ/+J4WbsTHklgYX/wIAavLorpq2bVBOTOu2i3yEYeeG+RE6
         VfRq+FGBNK9e/IxXHPH3dEfSTGLqm1E+msvB0VuxqCzPGvRZ8vdJBipxefD+FAhqWDbM
         0RH2Sxh/NFjMyMvtfuRLtomGW4AKm94W3/M+mIBoBVpO84SzmwnZkgWPSnOmaxSfHT+9
         1ttLRjmvm+X43lIiioMBeSi1TKlYE9DqpMCIpMJyCM47wOFCE8kUikfolREG/hFquOro
         qDfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h0FGog411UEPGxji/Cg5jpgMEim9v09uk8ZM7PGAUFI=;
        b=emC1SA9wflZNIwjLgl9yas9OogRhWTgsbx+pKcYWn8eNEhkotOizbTKVdOLJup2CpK
         oltl2lUFNTxkByZ72sdndm+0zkh3Wsm5urrx26rLzMu60eQzk8+TiK0fXLxa2RdT0JKz
         At3JwNggkjZKbmo/4hGpPSCvXoqpq7oLWPV4Xlnst6qmX4yFZcDPY0ejT5yRBRHrEylQ
         3K4OBeUW005d0zG1fSScGucY/0eCh33kxdkQSIdnNMzIK3mxS4/37CdmWgGrRxF69VjE
         ifCy1g3Tr7DRgK3JNpBX5SP0Fd4ZwLuyOYAlkA2IA5VEsD2I80Rv8meLGcFUXsIgQcm8
         ijzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h0FGog411UEPGxji/Cg5jpgMEim9v09uk8ZM7PGAUFI=;
        b=SiDbJUdQGTD+XLnwJmVfN4BUJ8XT4t6q12mxcdvIiSxSuWIKjG+6xqS0/HJQGfvU5q
         ZEoQ3y/IoAFBbnfK12RsQFcLrCD+u3+XZd6BzE81pyEe6KoT4lqrWf8Edx3WyOrQ2tAt
         GTlTizFGy4Ljkq9kZEWPJIsQyM2KK7rK5QYU4GlWibjXgnJYy6jMxVXI+JoAHmSBJOW8
         xKmL2501n1OO3e5WRGd7j00xN9QgNJLetcG9Qmi4aUl/Pzjd7xphCFJqplzbA+aJwsyb
         jxsLd+Wc3ICEYxlpRH7zVBYmfhfRp3XumvXZwZSaMhMJ2hjhGWwMSO+FpSJN2IMZGdDm
         My/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EGy6ZdR2tsDajgnxgIs8J7BNH/BLRMdMzKWhpmgPoSsIHPGHr
	NTvYn2T6BlxSdzCVG+1EGWc=
X-Google-Smtp-Source: ABdhPJwtfHitPkyhk4l/eJ/jWuA+8ztdc7slbkyk78sg9rJc5AyIZ2RTN8Q4hx18mbx19nDuAjeb7g==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr24771446wru.421.1619463111002;
        Mon, 26 Apr 2021 11:51:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e5:: with SMTP id g5ls2887323wrd.1.gmail; Mon, 26 Apr
 2021 11:51:50 -0700 (PDT)
X-Received: by 2002:adf:fe12:: with SMTP id n18mr24443697wrr.17.1619463110011;
        Mon, 26 Apr 2021 11:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619463110; cv=none;
        d=google.com; s=arc-20160816;
        b=JeSn61b5XZkn8GKEqSuz5d+9CBk9sDd/r3kZsjgkjMgMLsBUIv6FEt2VB6paCag19u
         CvjiF5CPBaveG3QR9E6n04z+rHnzLGPrjWb68IHpxJYragWUZVCzY7wHARaBJwPaiSZ1
         ubX+hkQ9fG84FG93E4eBY+2HJQrgRCKHem5GbUnINmhO/WlL/bxbkRe9fUm3lKfkH7xB
         ZDO5TIzCI4KeF/C9gPkdfVDLJPy+uH895qhWo8IWPOaf/+WwYNMpR7LKWpGfB8KGbWcY
         CNsc64Y4//Zk1M1dt7E/7GDl8Jb2b/uMW2i1VSs3yTtNuXklCEL+fezM6lJxqw1Uirz5
         PBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ZtE0lPxryC8+rQ/eLfkSSX/i2FXDt2HwKss5G2INwZE=;
        b=b0RV7opWT0oiCvuhvwvk4PvAJgENp7cYGLzNq6gCXq4zBzYnbayzC8tYF2PAdBvqPS
         0ouD47i+srE1ZjlWxoO3mEHIed8eliKGsAAR3cL5HO3fSENleHMcl/gQxX+V/AZ3L92B
         85k3gNnpkQJpbjRM6lASBurEELspQ6apOgskw059k2T2cFJKqYdHN0D5QJMvVUpDs/jj
         Me4VoNlLlyhPxTlZs9w5FvbAO1Nxkxg9+4E/a89p18Ylrio1rOqhSksRgDt3dvAHwUyD
         lxbMAULySW9lIBr3sTfb41gLgt22Hocrwx2sqj9OIUWiAVrjzuSe9X8xSq2TBfKw5TQX
         uoTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s8si1389767wrn.5.2021.04.26.11.51.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13QIpnYM028283
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Apr 2021 20:51:49 +0200
Received: from [167.87.23.165] ([167.87.23.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13QIiT01000325;
	Mon, 26 Apr 2021 20:44:29 +0200
Subject: Re: Bug in man page of jailhouse-enable
To: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>,
        jailhouse-dev@googlegroups.com
References: <YIasJ3qZXVF7vD13@hpjp.jpnet>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fbb05cce-585a-56d5-88af-391d30dc96c3@siemens.com>
Date: Mon, 26 Apr 2021 20:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YIasJ3qZXVF7vD13@hpjp.jpnet>
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

On 26.04.21 14:03, Dr. Johann Pfefferl wrote:
> Hello,
> 
> the description in the man page of jailhouse-enable is worng.
> 
> Instead of
> 
> jailhouse cell create <sysconfig.c>
> 
> it should be written as
> 
> jailhouse config create <sysconfig.c>
> 
> Hans
> 

Thanks! Fix is in next.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fbb05cce-585a-56d5-88af-391d30dc96c3%40siemens.com.
