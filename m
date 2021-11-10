Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSH6V6GAMGQEPFG7YMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83144C5E7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 18:20:09 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id z1-20020a056512308100b003ff78e6402bsf1518496lfd.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 09:20:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636564809; cv=pass;
        d=google.com; s=arc-20160816;
        b=g8YHylhL5DqotwFWYvOTkG+eOz/e2GJdvvJ319XAuMNT/p74UcPTLPMCisvm/Usutd
         mtLXb7wsn/S1lFfz6mEZmvvnQWneELMCznvnQhOyTc4MejTz3S0wczLPnE2hNXU7fabO
         /gqbBLTm0q6/+OQxQ4nYkXzDxxMITbv9YteeZvrQLkmbb2qLTu8TToK4nbhn+MVyeSIM
         VKZd1grpwaZBiiDjTdQW5r3idfitUE9oCDvbWzuv3toG/A7gGhVBZuEgh8ZITun8r8zY
         EGdIyK8dI90tmwznYlT7YHyKw+qPS9AbafkAcQ+P8FqwZrGbXkoop8ln2E+lHvFDID42
         2VUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=BeYi8wqjo7vyWebD9s5njSYLaP/7ed6UsFZuQBnY5aE=;
        b=zMFi9VC/88VLk5mhov7zr5WeQ8f5qkFMHmMq7UEb6n/ppH8WhEZJuZB4t+u8tJoowT
         mhJxXFwD1kNaSft2rfBkWsTuU4GAs642Hv4PKfdtTVBdZDPSIt+Yl3PBAbZ6p2diQ1rV
         9rchow0/RIcTqMvK8WiX15TaKHhYp76+27B2uZb8ms7rMTYsfZB2bvae+OERbE0rSxJW
         P4O9T/wC2wzGU3T/5wwFp1ZN9Xyiqg099iNJ9UC43Q1zZCe0kkEpTobLVFfYQeZZY4MO
         RF1QVloSqACFrj8dYv/xUK6kndUZwJMgLJbyShHZBwBX+3IOBmuN/DmOmYrJF+3BBvo7
         Z2cA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BeYi8wqjo7vyWebD9s5njSYLaP/7ed6UsFZuQBnY5aE=;
        b=UMHhKSDUrdwcsawbFap7vQIjD1OlHJNHDbQQ6MP2c4MRyemSUa6CcV+xj9OatbQj8S
         x1IKdRd3/sOiQNztvy82Dyq/mOV24awmiWJid5zHHonTvjNSLqALnSw/50IU0K/wPXlJ
         2ZkR/xDMLiq29BoDANNVNuuzcJe+mMZSlawNXBMXF+DdzLqQS7DfSWiS6H9lnzS9onWH
         WzXe1P8Xv6HHgqeQEsA+7+cVekSwCVFNaBA7oSO4ibxxeoVicunrPI0IRzQNZphq/ILs
         hMm1mXiQ2kShM/o/N0lDJn0MZGxnAi8pRRnzmYhIbWX6U/fNmvMTsCK5lvrljge24iK1
         eBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BeYi8wqjo7vyWebD9s5njSYLaP/7ed6UsFZuQBnY5aE=;
        b=Dp7878gdeO+ItTzAMmz0k9JE6SRrAyeSRiQjusoxSa4fJHUq8ZLSWvPeiLIVCxFZJF
         e0UNHJptqTjXtRv8QrK4QjDZJ0k5lQrBpT9skpxhHi387Sww9O+lnRGFIKo3XmohpK+b
         NE5L/COv5A69I6pi/XnX0Gl6sEqXQkgp+ewCPG0pHa20GcS9Dj3pZPPpgwe7/JwLEpzw
         qFgG9uvi/sPFp8eLH8rAAJe2df9re7xMwNQhM9wUa9agFRhSUAjbt27Fz5xKNhCVH9If
         AxBbf8rTYMIAsSDnDgg8i/xBR2FfJ+8uhoBT4YGWdgd1vhDzk77bvnwj3lrM4beDK4Mk
         wlLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530w9QqhsXO8OnQFMZiTUfoPrx62IkvuQS3C7b0f23wposwTlutb
	UbuPVTMgrxKNiJ1NICmOLRg=
X-Google-Smtp-Source: ABdhPJyOKnlIRFDlbmT264NdEFE7Z0OUTksJzkx1wY/CPryq/TyTPoyuy8B1HCrrgDj6C5R1sBRv8Q==
X-Received: by 2002:a05:6512:39c1:: with SMTP id k1mr609884lfu.673.1636564808792;
        Wed, 10 Nov 2021 09:20:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1251:: with SMTP id h17ls87711ljh.6.gmail; Wed, 10
 Nov 2021 09:20:07 -0800 (PST)
X-Received: by 2002:a2e:151c:: with SMTP id s28mr603658ljd.348.1636564807659;
        Wed, 10 Nov 2021 09:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636564807; cv=none;
        d=google.com; s=arc-20160816;
        b=J+li+yNQn57jZg3SE6j9dTzG34NCU7GMVnKgtqqpq1KJE/FiOGFPUK3a1V4rFLx7s/
         tRrKUAxZDofbQGJEo9Eker4nYXYraazxBTUA+IaJdJWwpu1TrszHY7vsSBKstAl9mmGR
         kq7W2Fj3MaM7dH79VcesfvW55d3Xj4Wcwgavr9OIvwGQrvycdu6C1xO/lCdFJo/T9t0q
         AZjM7c6Cqqh/WNAVqEZLhZpBboHmoIWCLcHJEKyRf0KxrWEUkqzHOhRpdqOxoRAc5Ax2
         WR46jNNJyCkITTgHK+/PN2GoC2hnY8n1kl4nmPeXQVvp04/nDBZxCpGjlczBhcVvd7WC
         NkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=/FVp7BQr7u9SwrNJLdw4mnAz6bS66nBG5nv7Ig9nmpg=;
        b=O7/TNppgk67+JiVZao49noBun5R5roB7Qaq3knZLFF7ZEfVgG0QkU0e/r1mUH1zHdV
         PofJMPrWlP5xLIEnaNnIyXHkSXUT5R1Vg23FY9Xxol2dW5Ma5aIZjf7wuFZ5oGTWUrsO
         EgNcM52KTX7ynMm8bWJgAFe1D7anbSqdKzeM8sZSJU5GhZskjcn2f5WoZtKqMQnb9/2u
         NYw+cT6krmuSAElf03XCxPPm5l1ul26LTRZxNgv/0G6P0XaDCw7tmy2WuI+r4jp+syij
         bYf/fv6hKLHtkyfNytF62oSSaijy+F7bN99EKwyV8RJ95+I9o2fvgZJlWVCsuVpdbr+i
         aG5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o22si31500lfr.11.2021.11.10.09.20.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 09:20:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AAHK6xu010433
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Nov 2021 18:20:06 +0100
Received: from [167.87.75.31] ([167.87.75.31])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AAHK5wp022711;
	Wed, 10 Nov 2021 18:20:05 +0100
Subject: Re: implicit declaration of add_cpu and remove_cpu
To: Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrea Marchetta <marchetta.andrea@gmail.com>
References: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
 <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
 <f3c70343-1f25-4540-ad1f-b0831d31dabdn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <43bd55d7-a77f-b979-102c-a947f07b8273@siemens.com>
Date: Wed, 10 Nov 2021 18:20:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f3c70343-1f25-4540-ad1f-b0831d31dabdn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 10.11.21 17:58, Moustafa Nofal wrote:
> I am not sure, if I should answer to this, but this can be solved by
> recompiling Linux headers with editing kernel configuration:
> add CONFIG_HOTPLUG_CPU=3Dy
>=20

Yes, that is a precondition and likely explains the build error.

> this would help your problem, and jailhouse might work, but you might
> face a problem of Jailhouse adding no virtual devices. You can check
> this by lspci before and after jailhouse enable command.=C2=A0
>=20
> I have one question regarding your 5.10 kernel. I tried compiling it on
> 5.10, but I had different error, so I was using 5.3 and had no PCI
> devices, then upgraded to 5.4 and I got back the PCI devices, but as I
> said Jailhouse still cannot add virtual PCI device

In general, reference configurations (kernel, jailhouse) and
integrations can be found in jailhouse-images. Deriving from there is
simpler than starting from scratch.

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
jailhouse-dev/43bd55d7-a77f-b979-102c-a947f07b8273%40siemens.com.
