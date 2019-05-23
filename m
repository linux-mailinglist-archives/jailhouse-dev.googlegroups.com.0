Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN5JTLTQKGQEJ6LOUVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 217AE27CFF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:40:24 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id y12sf8828710ede.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 05:40:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558615223; cv=pass;
        d=google.com; s=arc-20160816;
        b=RGDjRrlAqcEYzjbUAQwpwQpjk1/yeKEImLoWSDxTx0nO1sLYeLDcjwVp7GneqOZg5M
         QtK3pQYfjUea5owH9drdZBjPGDFesaQlx3saJa1tlYDMH0Xkpa3rXP9vavigb3RHsLug
         46lhtMn/1N81MxTFkljqyZp7XRzM1dhdJXoq9uaSlsU0eXSOn1Ku8JWzAn1qgYsmkxs7
         7Ywo116WsBeZjJ4ntLP9DvcgL/U/DjwNW5SbfzatvC8X5kJOwcduhsHnyEhQjl8n6eQH
         y8EVeNR38bDxQJmYDNaA6le2HElCHPixzR63YnomR4J9N9b0118xWipZmGzOcEma5Tk9
         dTiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=37T6GBdbTG0qizYXYOmPupj+L/c9DlTKHlHIjtjpUf4=;
        b=ybKUj4yAhNa1ufaK+WcgPsE3kweGpNaP2sn9mP6eP5nocjEochkxMHLU/JIG27jGvd
         KPefcXvjP+x8Iwr1O7Th4/fM0go/J5AeeUXz99h9GR0ACqfvaK2F2Q30JzGyBK65qZvo
         HwJNTxc7GoF1LVrDJp07QgvzVhSqrfUhgbqXxIktSbC0yqox9c0D8qErNwRumK81/QQf
         l2JHIUUsNVfQ32+9ECvgECPqsTGW8KmSAMnJYNTDeJq5URUBV6u0sh0n3rGaZwOgc175
         rEGMJdEADwsW2Ca1eMwZ3Mfn29bHQNgPnn9YwMIJoNSgG5g0tOK1VUKstsfKg2o5ky1s
         B6pA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=37T6GBdbTG0qizYXYOmPupj+L/c9DlTKHlHIjtjpUf4=;
        b=htxvxl5Yd657DcV0E8lTO2Pp9dzm9MWILJgL2JtKwihL3cxAVhlwkrVxGMUiVuSZqc
         Pu6s2dXNHvcjGJL9fwDdNRU7xCmh4piaR0K3zmKS5aVd2J5/BsDL7OwSad6jQpq9J29l
         rIZJTkh4n+XcnCHviMn/0yaxC24p8UdLqK3j05pWUVcm3D7Pz81urXNLl+ydAYlZlMx6
         aF/Jm/ML5foL+Nq4otMbCBnAbSgZPeshlE1M9butO0s/hjDbKisa/DJVbHPPrLCxDaIB
         LCuQH8IX9Jlm+RdvelQtALkZZvqhn5dLYeSNl9adCAhLGT726XeSNxWK1UvRsEw8vb+H
         QbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=37T6GBdbTG0qizYXYOmPupj+L/c9DlTKHlHIjtjpUf4=;
        b=tnbK+v1YijU1WCYftZjvGJDasE15KXps5hvgr+aWEyX+p6Qgh6YbYAhnz7FOs1G1vm
         Y4B2gcGnZ3OxQKkMmwwEAlzdSvynPwokiJPqVVjEGbWSpEKkceGtSXLzDh6Nbgj6rs8Q
         ezLMDjE/mop404CFH2WTrQig8/ZJ4YiIC+RBVQE6lgMLaPLO5ZLPyiEwrNtcAZ2RDX6Q
         oknryy2bITm7aUwNTIsxFTCkE8NJ3xlWvTH0J0iAvYLKtAWj2FKuYfSfoiVkRRw5B0PN
         nH2K/2rEmtzNQ8CAbHRWLBYp1ZHwfZNLtRfrmmpEUUL0gexHqhw/a4F8kz2Ghuqr82zC
         QqIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzSNphCSlzD8TkrxbUR25cluYHo9xARulD44bcDhFduE8JNmGK
	XcPo+nyqsxGJM+ie1oWzEpk=
X-Google-Smtp-Source: APXvYqxS7lm6XmOVnTsTpSu2a2z7/FFdakAcPCxAhhXob8ZUME2o5uT8tqVHMvEQ8B+q3jxDgOcd3A==
X-Received: by 2002:a17:906:f19a:: with SMTP id gs26mr68559780ejb.78.1558615223863;
        Thu, 23 May 2019 05:40:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:95a:: with SMTP id j26ls1345496ejd.5.gmail; Thu, 23
 May 2019 05:40:23 -0700 (PDT)
X-Received: by 2002:a17:906:d513:: with SMTP id ge19mr32845618ejb.222.1558615223283;
        Thu, 23 May 2019 05:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558615223; cv=none;
        d=google.com; s=arc-20160816;
        b=dJXf34Wd1htCVpJhFPAMKmX0y8FmLvF+MxjxE3VC8BMf4xrPDnhC+TsN2FLBoCPRuD
         oQnedA/8LeOg9N+Jpi2HUgv5M/w6weKd2F91fPwoM4pHiC6wFhzX2AMn5ClxaKy/ZnoL
         3bW6iypc7ho+yjIoqoVxj1JVA255A4OiSZFHvhUPX704ucLqPoL9QcbFw+STkDgslYEG
         5uYG8lJUbgXT70xYfvkWDx4WxZBDYx0POP1a8zQLG2IAWENGiMIWnA5SlNne1Xzmg//y
         zOrO255F+qUEIt/B1aOKUryG5RV7DjYgY+fK8Q/GqJMRGrbUrSTynPCYs+uVoqkJVyCA
         QT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=uAh8SpiR9eSTYXrM9vN77lVsx3pCyOB6DKWB0+/AKr0=;
        b=DrRwWeFQ3R/Iljl3tDG+UhQRzZOHFN8Lhqc4Pg/pCPKXSU8Il0lHQ6+TVl/Qrc/K6g
         L4/xCTD+gM8cet2AQ5aITVgj6gVr8Lg9NhYTt3dSeXyx9SlOq8zyE93oLI6ONaxbQ+w3
         DbiwlB+Ve8Flv1TblzJpDqHB31QtzawlMx1S3Gu35JALs+SBTcvKfpEhK3TDMos6oLRJ
         szB1jbddbyBrMPwcNCBdNXURP3wG2p5P63/pfMJpmG6a4IPD4bHl0aNetKQ6IBvf27r5
         6hE1pdPlO9GXcDjyoZk4gj5tpfZY5HO3hS89d/qBoT5pt1NaRUke6+WE1pd93AltCVGm
         PjVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l30si2898226edd.4.2019.05.23.05.40.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x4NCeMV8020336
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 14:40:22 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4NCeM5n023377;
	Thu, 23 May 2019 14:40:22 +0200
Subject: Re: [PATCH] Update CR4 reserved bits as bit 22 will now indicate
 support for Intel Protection Keys Extension.
To: Yasser Shalabi <yassershalabi@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CACkfA5uv_wSnv6tPozNx4eUT=H6v6cmLex85VmXRMs4FWQ4hBQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b91ceb1c-78dc-57cc-de27-bb072c62b185@siemens.com>
Date: Thu, 23 May 2019 14:40:22 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CACkfA5uv_wSnv6tPozNx4eUT=H6v6cmLex85VmXRMs4FWQ4hBQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 21.05.19 20:03, Yasser Shalabi wrote:
> Without this users running on recent Intel processors will not be able to=
 use=20
> jailhouse.
>=20
> Signed-off-by: Yasser Shalabi <yassershalabi@gmail.com=20
> <mailto:yassershalabi@gmail.com>>
>=20
> ---
>  =C2=A0hypervisor/arch/x86/include/asm/processor.h | 2 +-
>  =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hypervisor/arch/x86/include/asm/processor.h=20
> b/hypervisor/arch/x86/include/asm/processor.h
> index 50b997cc..70a6c3ff 100644
> --- a/hypervisor/arch/x86/include/asm/processor.h
> +++ b/hypervisor/arch/x86/include/asm/processor.h
> @@ -66,7 +66,7 @@
>  =C2=A0#define X86_CR4_VMXE (1UL << 13)
>  =C2=A0#define X86_CR4_OSXSAVE (1UL << 18)
>  =C2=A0#define X86_CR4_RESERVED \
> - (BIT_MASK(31, 22) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))
> + (BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))
>=20
>  =C2=A0#define X86_XCR0_FP 0x00000001
>=20
> --=20
> 2.17.1
>=20

Thanks, applied to next while tuning the wording a bit.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b91ceb1c-78dc-57cc-de27-bb072c62b185%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
