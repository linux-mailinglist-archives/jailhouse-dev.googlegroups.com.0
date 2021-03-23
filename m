Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHOJ42BAMGQE7HEYYCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5365334598A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:19:42 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id n2sf414907wmi.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 01:19:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616487582; cv=pass;
        d=google.com; s=arc-20160816;
        b=UOMDwHEIiipwdaNUVt7c0jtjfDGKRk4qcu/3poQ1NPFBb1TOdaiRqj5uYnAqGK+DZv
         Dx2BqvIRz9hZXW2YyYPVa/kx6O+B4cqMtZyo+jkERwoBMvZvyr/kiSSi8NCrJ+u4ItVb
         4107I1ssPGDa6RfCR+r1rV5V0mq2OYH0aumUaWEqTW0ErsAvchu3se1SSBIlac3S5pjn
         8FR5KdfUqsMDXaROdddKGpJVgL69HbldVRrKWztTxuaQ/hT0+4wk32Q4geWdrQn3OVIX
         6mLZPUT1//L44gzvOd9cD0LmUO7Z76a+4yDgd90Y/8DuNOXUH7a4Txvb7sSd1pXVI6zP
         h9jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kfeOL34n/n2eRsYrVtxoSaCGmQpGlJUbpyDh4W8Rs8o=;
        b=puT3opeAVI4kT/NprRU9JkLuVmSyZHM4aYQVXDjz1kiOc601cUVJU+njE3aFJ5t25K
         heNsA7uS6m3YngICPT06nbS3WBEeeip4dpfe15vnqqmCSLBRp3+K6owDGMda/NyqXl74
         l22N3g7m2/HuotoNO/8AY+FEnlR6ZB4Wsk4VXinHv5lHIGir9/I6aUGSp7lj0nBPQ6RD
         M/ZHatBrwMcecqEV/px1ECICeh2dHtFlWskCnGz0j5Lb5nMe9Zw1ysQhdoBw009O/ks+
         0o7Tudb5zZbA8ip3+UpAnOs3ytNz81EIXlah0SASVj1gNQRgh2y70IX5xGqk4EWSh8ac
         VHgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kfeOL34n/n2eRsYrVtxoSaCGmQpGlJUbpyDh4W8Rs8o=;
        b=RZp6Hx2hedQRo/jDRdCdP1k1n+oxCanDZuv3bST74d26WbZyCk3UDG6mR8BZlI58/H
         oA34FintyWydKrZfWGU2uDGPxCzGKAytxfyUHlbA6GF/5wClO79WTy30mwzmU6sMfCMT
         Fm4okJ8EoT3XlwOH8DQNK8QoDzmsxiHXFsLi1RXxfydZTj3IAmIB+ohFKn+tanyY/vfU
         6NREAdEYPLNaGULbYIBOqcG3TyXR9OZkMZvmxcQQjpKQnWHv7x0+eDJQqY4iBznwu4qB
         aFzE6HBaXZB0V7fqquYk6inZ0B7f6I0JP79vB2icFN7kkw8FLjkREjM7X4K2xPKf6qNt
         n/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kfeOL34n/n2eRsYrVtxoSaCGmQpGlJUbpyDh4W8Rs8o=;
        b=GwRRwpv72t+qUK/Ck3Jer6bYfI7ideML5+MuEC+oyPewNPlAGe2jMinevAl5xhnEjT
         H8qeLVnrjkBsXWJ0Ug3YtW/AamYneCCQrqLeI4MrRShfKHIN9vv2cc7uEUzSaSgMk113
         z2Jc024dykRXO0g3SvnsPGlN+A1Oi+RMhwdLrE7qGS9p7KUt+V1TttjabJuN0QdjNv66
         0Zhi2ufDRJicwMmFsgUCWmnSOTgy4RSI4YzM0TAeTEGjLslW7BuI/HILuN9XUCKEc6Xm
         1oipZBtcU8B7soJazAUWVTrbfI1wB9pEO447qxkjFlMUKGhUqyOvCAEENedJN94kRJAc
         uxLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Gxnj326kKlw5zbOWbvIPTrQTdGsZI+9O358FeDG1dxr4M5XSe
	9UtbwcPpFIkXlTktwVSjVds=
X-Google-Smtp-Source: ABdhPJwi6TGD0ADrcvTitkT08bUnw6OSKMkZGmmaz6NoL1M+ebQKwihrBXtUyhkALvt7HfNTpRAqZA==
X-Received: by 2002:adf:9bce:: with SMTP id e14mr2789664wrc.29.1616487582104;
        Tue, 23 Mar 2021 01:19:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:58f0:: with SMTP id f16ls1618015wrd.0.gmail; Tue, 23 Mar
 2021 01:19:41 -0700 (PDT)
X-Received: by 2002:a5d:6412:: with SMTP id z18mr2659021wru.214.1616487581148;
        Tue, 23 Mar 2021 01:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616487581; cv=none;
        d=google.com; s=arc-20160816;
        b=WAKzPQhNXrlyPUrgH0HDxfulHpYT/91DnUc3B6X/hIzI5KcU20Cvlq/DQL1VkcqFWo
         AH8EvZ1vUadYOAz+WlG/J/G1BkMxTd9rxZp3+ZPBozBiDeUFw5EWiDeiO3AOpmHSrtjL
         xAN1aElT04fAB1UzlgugCm5QfSLGJtLTTFCHQj0zEf1JSa5jP1MMTfIMT5CHYcz9pZ3J
         UBA0uKDBsntQ+23MR5ERZlGiSHf+p3EPj35oDGG3xo+CiDsLFat/K8VeeW6snirfYZWX
         04us70pZprUEUSSbV/I0IokcqG96aVI/6HsHxRRsNjSK/KEpEcY2o616YQ1MhkYADRhm
         MQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=KD8UerIw9lnNF+ESoOzm05+CoxKFUtKteGQ4C+gk4nQ=;
        b=pKNlYFp2tabu8aiUkwzGbp9PdRaSlvkexaQEA05EcWwKjMRDJghGhHsVsZSXtUFuDb
         T71pqIp9+nsaLTBFignZBtEmhFNc7pAVGQ6YZm5o502fZ9yxcu5dRP7QiqGWpBwajDZB
         G3m7FTUbv9IRFcFOfMRmlS90IW3XQnfTQLS0nYipOM2Vi5SnEAlf0R97Pu1VHXTVwp1W
         jbo5oyoF9i49D/QD7aWQr1fA+6vlCFJbiANDGzRsopNXOeBtLouEf9tr+1L6cyOmIMsm
         lu8MDU19sxqvmSDm+bNzp0FNvPyRaSxnvx7F6iJt487qTh8D8qoy+OGLQZr9Chr/YfUs
         isDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p65si122149wmp.0.2021.03.23.01.19.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 01:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12N8Je6g025240
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 09:19:40 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12N8EeaX018094;
	Tue, 23 Mar 2021 09:14:40 +0100
Subject: Re: [PATCH 5/5] arm64: imx8m: correct pci domain
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-5-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <569f4ca2-ddf0-89cf-85d1-da3dfa75d99a@siemens.com>
Date: Tue, 23 Mar 2021 09:14:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323062536.3888-5-peng.fan@nxp.com>
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

On 23.03.21 07:25, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> After linux moved to use linux,pci-domain, we update to
> correct pci domain here to use a domain not used by pci hardware.
> 
> i.MX8MQ: 2
> i.MX8MM: 1
> i.MX8MN: 0
> i.MX8MP: 2

Which kernel versions are needed for that?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/569f4ca2-ddf0-89cf-85d1-da3dfa75d99a%40siemens.com.
