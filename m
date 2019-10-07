Return-Path: <jailhouse-dev+bncBD7LZ45K3ECBBD4H53WAKGQEZGJGNSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945ACEBC2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 20:27:28 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id g24sf1658194lfh.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 11:27:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570472847; cv=pass;
        d=google.com; s=arc-20160816;
        b=h077TVG7G2vWKAYWMdBDDqbuMgxPNGH021bKUby32Tz/GVe1S8fpaIEeModBp9ty65
         Ti5ncYOTGbjUBin5osmKbcZ+yeZUSaT5+0adNvyqDb2I4lvS0lAHNdeTdLfi6O2oGwMS
         QkJxTFTmZFpihPpa+W6YLPHNNW2WNK15wITCZWiynj+u7EhZ0ulQB1+us3AvZ9tvSA+D
         Z/VLmtnnLLFsfOgMMAr+xF798gI15H/TjrTxEV6cBkb24tvhTimVHZDsNphWOk0nCtnR
         3OX4xdRy9R12AiQ1bIc0JfYHaGmc6ZsOmKpqwBjC1sswS7RiNcvQ/12ErvfpjZDKJ90T
         EgPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=r7axRAJkJiIY88VfNRBzU4dz9AmD4nKexIaimcE/aEo=;
        b=mTZv0ndjAkieWYtimCr4KLrZJ6/C/6DS7qTCswdI9KWcPcVhT24UBN1atDnMFKb64c
         nEPuZB3wOXPUqU429kx+27PtwJO3byQYH6DzCy2xyL07chXpw8yJ7aM08/wvzSKf55FR
         Lcjy0+/8zOomAHd4DpfqyaEMrTzzRkCMpm8cYNz6Bz3/dfvT4bFCEj3taVkAzGOMUPr5
         qPG9odFO388yhDZFhC7LFFRdVOX+8c4wCo0B+9BfrFcEiQtHp5MYKYSO4fxEkL1rJQYq
         oslK3Q/dReSKWPNPrHNm/yniUVD5sf/3DkHFOif4MqRo+8lwkIONxY7k1lfxQVxhFOCU
         nENg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LuS2Amki;
       spf=pass (google.com: domain of mingo.kernel.org@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=mingo.kernel.org@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r7axRAJkJiIY88VfNRBzU4dz9AmD4nKexIaimcE/aEo=;
        b=GV0mB7c3+34Wfrr0bdaiOuuCsJHAuRDC+lDBw4AgJAiuFP4pEYfXJym8kVnxlEDIZh
         8h6DNt12D3XU2kYoRRaaYXr9qu0lpBwl8Abj5/KvEPTC2fgR2XtOh15nG6V8oVSlIFIg
         ofclj4rlZdYqDtXmjvWtK+QlZmLBRRy69tqve7KSvpvEvzzB0FFm6z8zu6wo9EsnTHgU
         T9AEQKddv0ehYQ49BRS2Hds7lH6cXyxz+wZcrGzctieA6BLEgEiHzIDHDg+6PMwSABTC
         mTnIy2uEZ6E+BL15h9peqoLDcxNGVh8C/BJ7sWB3WDKgwyVTNMetqOxCZ9AbRNm3QFWp
         iiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=r7axRAJkJiIY88VfNRBzU4dz9AmD4nKexIaimcE/aEo=;
        b=KinsxbZsD5bH1mg9Zq8+8THhYM/bTXu6ZnOekCWlj2ASVIlvPZ/JOXpNb0a/XkmfH/
         3eOGgPvejmiyBkpj62Q7yjJYWwPpZqQntquvXOr38oN7hKNBfoKx4U3cNfdJwd1ysWvp
         2Wq2b3mGHlrLDJJbNioO6w4CHIAR0U04S+QsUbIcqsZRWntUFD9zsFlWj3y7t7yDdcft
         dOdqPcs2HgEvUknWz+cTmS7EW0KiAzn5Ek+JEF1FN+mYPHicAd7dk7vijSJjjXQ3EdTQ
         W2zRz6kXb/lXnWGGy+de6g+/TVEtMcaraNqRDc2B1pylylsxsSPBitx/x3CHJjiqCVN8
         cZWA==
X-Gm-Message-State: APjAAAVcW0d6E4A4ar7X6uO6aJrTN3rG4XP3B+vX/hJny+JTQU6c6JSD
	iaPz+e5YIDygEYavTzLDQQA=
X-Google-Smtp-Source: APXvYqxPp9eik5B1/4D7gw5HqHyKwNwO7ofSNde8bkzPIO7KegpdvU0wZkhLC1Mzcdi8gTKKl726FQ==
X-Received: by 2002:ac2:5965:: with SMTP id h5mr17187706lfp.129.1570472847692;
        Mon, 07 Oct 2019 11:27:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:559c:: with SMTP id v28ls44936lfg.10.gmail; Mon, 07 Oct
 2019 11:27:26 -0700 (PDT)
X-Received: by 2002:a05:6512:6c:: with SMTP id i12mr17697079lfo.40.1570472846739;
        Mon, 07 Oct 2019 11:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570472846; cv=none;
        d=google.com; s=arc-20160816;
        b=FdQ0eRGGAnTLgA6KMPoKG/IeH4odPjfsdq+ovaH9X7CrJuR08BdgPGvhTcgP2v8lgo
         Np2NemaVgDGzUVq8MjsWDWbw39uKS8+Gxruu/GA6zpuVET3so6hBO4buksPvnji1Se49
         rFrosMb9SEg6VrqU8jPXRnxGjJY3njQh4GA0F3D9VVc8Vms/ZVgvw+GXsHtSbUNku0Ug
         ow57fvhhu5oV2vUdcreLWk9rT1wN9z7qZJiaEYK9hzAxPZSx20nHa4AVfbBr/OYoonhQ
         VBKt/KMST8VkLYx9qZXb+AUq3SXx3zrXYZEckh/PC2Qa6331I46rqvZ0nMngI0bRbfgu
         sXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=suz6k0HPLihLeFdDPNbxBchocJGneApTO5mqjNjL2R4=;
        b=FqQq/AcLN34dwtOLgDiEGpM5waqM79xegl0XN04xBIDIE0KNuzATvBoG6bc7GuGSVi
         Hmy2awOllATuyl/KGMIWBbIlH7LKhGwQc+QVTDCXGtlVgZfj6tPbHIlhtTxyrrf2V90D
         DW00o9L8m5aR99YslA+ktQ/1/EYmttmY9gSfAIut/9uq9TBsQS4WjfapguSwbrwZwdeX
         hw1d0qqS2MKH97VUTuevQvZItbZxdx0AqHYKfBJ5kSyboaBLHLK7Wle1GHdeOjUbIKnN
         0c5u1SsBdcigvI8HLunJRF/5BtaHppCFukLJ4mzz4oyDFEeABDuMly+M1MQczxOXiu0u
         tP3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LuS2Amki;
       spf=pass (google.com: domain of mingo.kernel.org@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=mingo.kernel.org@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com. [2a00:1450:4864:20::344])
        by gmr-mx.google.com with ESMTPS id k24si1097928lji.3.2019.10.07.11.27.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 11:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of mingo.kernel.org@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) client-ip=2a00:1450:4864:20::344;
Received: by mail-wm1-x344.google.com with SMTP id r17so637257wme.0
        for <jailhouse-dev@googlegroups.com>; Mon, 07 Oct 2019 11:27:26 -0700 (PDT)
X-Received: by 2002:a7b:c8d9:: with SMTP id f25mr405652wml.173.1570472846221;
        Mon, 07 Oct 2019 11:27:26 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id g17sm7927581wrq.58.2019.10.07.11.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 11:27:25 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Mon, 7 Oct 2019 20:27:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-tip-commits@vger.kernel.org,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	jailhouse-dev@googlegroups.com
Subject: Re: [tip: x86/platform] x86/jailhouse: Enable platform UARTs only if
 available
Message-ID: <20191007182723.GB97660@gmail.com>
References: <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
 <157047270440.9978.1646295335019419258.tip-bot2@tip-bot2>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <157047270440.9978.1646295335019419258.tip-bot2@tip-bot2>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Original-Sender: mingo@kernel.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=LuS2Amki;       spf=pass
 (google.com: domain of mingo.kernel.org@gmail.com designates
 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=mingo.kernel.org@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
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


* tip-bot2 for Ralf Ramsauer <tip-bot2@linutronix.de> wrote:

> The following commit has been merged into the x86/platform branch of tip:
> 
> Commit-ID:     dac59f1eb78123c3f0e497eb9870ac550c59debb
> Gitweb:        https://git.kernel.org/tip/dac59f1eb78123c3f0e497eb9870ac550c59debb
> Author:        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> AuthorDate:    Mon, 07 Oct 2019 14:38:19 +02:00
> Committer:     Ingo Molnar <mingo@kernel.org>
> CommitterDate: Mon, 07 Oct 2019 17:35:56 +02:00
> 
> x86/jailhouse: Enable platform UARTs only if available

Never mind this commit notification - I pulled the two commits for the 
time being, until Boris's feedback is addressed.

Thanks,

	Ingo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007182723.GB97660%40gmail.com.
