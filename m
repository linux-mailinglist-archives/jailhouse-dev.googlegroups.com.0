Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRUTTSCAMGQEQYMEVQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CB36B938
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 20:43:19 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id d89-20020a25a3620000b02904dc8d0450c6sf34353137ybi.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Apr 2021 11:43:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619462598; cv=pass;
        d=google.com; s=arc-20160816;
        b=bVSymylyOrmSB8bgZ5N7hwywoecyKh372SFRrh/9xhynJxshHuvMIATSnyqmill5uk
         eRTIUtuZBPFefUW1b6IgqF6qh2k0AO0gLbpBJvA9rtNaL+aLCJE1HC1RqTD+Ftneo4Jm
         0XAn2As/o6lHA05r7LVvNuZambo3bHT0deCNH73ewJ4QOdZtA2ikZjvq0zknWXuPeYdh
         fsqf5lnvAvCTwvlbkzZVWYp/tBMe+V0gWMN7XOipcH1cTOO2WXIHUTcn8f6N/9oxBlRk
         JDeczbcxSvl3F8VwnUdwjTPEwNC6CsrVioUtZxFQcB0nG4tlZU2UK1g/8szU6TTeHM2O
         KAwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=F9EWRHn3ABxEUVOOkSggD3h3EfSqcaOGjqJ3wLXqF9E=;
        b=YWkBG5tjLSyLkNQ9BLz+oSAhb3iPKHadpotaQZVYbI5VBrGAmI+8C12FS3WJCUG1sP
         mxdswNLLsQ/maiEwfww4+c/s/5Rh0DwahIVUGx+fo3ti3We6TqTVAN/gJzdNaJM+vFXG
         msfUOoPtLOGs6pvRopflAn/HYnxidPqlR54tVseZOKH/mkJM7GBTuKcQxLh/4vo/fY8I
         1jr+7V9JZU5BCdGHukRu1Mj0yew98LKmBs7Bs4dpf0siAtqsR/mL7bqiubtvKGU+eVyw
         W8HsuX2ghLb8wlOlziUpErpRBpXqpjup7NWs1FSN0KqMSpBRAMmvqeO/LAlRmIuWt1tF
         Dlqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=hi93WOAx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=F9EWRHn3ABxEUVOOkSggD3h3EfSqcaOGjqJ3wLXqF9E=;
        b=fiyACGnxPWSbegqzIVsY9yxR7AZIT4jKH3MQXuCd6b9dmAguzUUo2nx/wg8d7yyFn4
         sqkTBgJ1TrznGVCXQT/bqXESuR8y3rHIio2UXw+iq1knSD4FoYFOQQlFOjqPZ01ZO2UW
         EwexuFJxEVXdpb/d8unNRcXhs9BfFpsjLhzYQ7BFShZlde1YB4tuMDV1KOuJQlMa3//v
         z+LMmAmHdduwZD+u192VSP4YpYz/htdg3f/GQ6+IN0GDOBb8cyWXKKkcrByH69qebs0F
         Bjqg9AmQ4ymRZYFkPGZ6wMFE21BkKNmknTw2QP8jjIZWAg6aj9Su3J+XPzcXpa/p/JYU
         FXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F9EWRHn3ABxEUVOOkSggD3h3EfSqcaOGjqJ3wLXqF9E=;
        b=TqQ6/yOTmLxPYqxUQbmEaPWAJyA2ULrQICza+dzbG6ln5zoTlvC1lRtaNjhBEpQYOh
         ULZ3soddrJ36ODwhXLSFKR1Bmo/swNk+c1sep3EzVK69976h1/kome/ohWJw3h0Jo0Hs
         BhcdypaLjmZMaVJucakuV3kf5UW/VwUc/M8LwH7UPnJtuK5aKpjL1piIi/a7njwWXUpU
         iXjIz9f4W+KYc+c2yCg04ZmRb3nBV3cXWuWYm1B+Hb/9hV6ltftbSfICkB8wRmZz66N4
         aeBc001LyaCk5n0zviERNaX26eDrMBTuWs/TqLM2S5VY/ynSnoAd5I68vwz/uYVHJJxi
         6OLw==
X-Gm-Message-State: AOAM531+wYdGdylZ7W0TlPA5YWL74JBgxM7adEWeymdNr1kziRWu6ssj
	vxpyKtb5liVHapPkSp/bThc=
X-Google-Smtp-Source: ABdhPJxwtaM4/jcAPYjQ58gnWb7fzIEMI8QZCYs6Z/+JqpxkpUbOhUQetrbQ83TwCAU88mJmrgSylw==
X-Received: by 2002:a25:b708:: with SMTP id t8mr26559339ybj.320.1619462598775;
        Mon, 26 Apr 2021 11:43:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:9307:: with SMTP id f7ls2728284ybo.10.gmail; Mon, 26 Apr
 2021 11:43:18 -0700 (PDT)
X-Received: by 2002:a25:d68e:: with SMTP id n136mr27658417ybg.68.1619462598278;
        Mon, 26 Apr 2021 11:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619462598; cv=none;
        d=google.com; s=arc-20160816;
        b=rSfMhYJJdPXa3atDQcWIToRUkL/KkGfWANPhogaXrumkbLmJeXBJOtQCM39nLVEw5i
         nx8J3pN4LE4dNPsSolC6hZZ7yCi6sy0JQWqpYL8AJCkPxoTvtzsTI11e68sv3omsmS40
         2DHiEzGoARjDlC2trLm0ZyB1tFo4or1CZ7uS8S+1y4LjIlhZcXvs43lWkhChOGr8TuRP
         RBTGRPW0ITt6IFPeV3yD1o5R30YnW2II6R1CrjJrYp4Uksn7ulDJrQ0Esd1nEEUCnWl2
         SHzljINPqVm3kbdveChy+XA4EHUbUJKpPcETaY44cKDbRduxbvEE0pzrukKr5QCoaflz
         L4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ZPdRnaqS5XJ6pK17gM0yqNAaWizoNtgEdnyciAMI3bA=;
        b=ehcOfO1JZQyR1rgZ5UCuWt4HwIzrMqL0zolcwUYeDYbIC4nAFRSJqGPO3kZkn0Hi0V
         3GbkSmZ3S/m5KA5mrZflN5rio/uDVJZ/G5sI64fIJZeMcoeCv/f5ZBnrWZQ5Wm6a9JAf
         lvVp9+9IqgCnU5QH5BC8KXNDM/L0q2Iv5XgC/p9VfyVbDoghq8yLK4Y0DZEdVZisH1UK
         p23RYps1YsPoEbgj3MsE80zFIOpZrHv61atiepEXXBxO76JUnPCOuT7fTqj9KPcNmEWT
         BCsEuzZz7jeqlCPstzIvuKKaKVQg/T4xFBQ/liBmW5QyuqqG+BUPg7N3vvxA7p9V/3Co
         5ajQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=hi93WOAx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id 5si418869ybf.1.2021.04.26.11.43.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 11:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-312c3a1.ash1-iad.github.net [10.56.117.73])
	by smtp.github.com (Postfix) with ESMTPA id 07A735E0058
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Apr 2021 11:43:18 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:43:18 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/95cb81-e0ba79@github.com>
Subject: [siemens/jailhouse] e0ba79: tools: Fix mistake in jailhouse-enable
 man page
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=hi93WOAx;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: e0ba79023af9084aef86003c97a91b705e3a7c5d
      https://github.com/siemens/jailhouse/commit/e0ba79023af9084aef86003c97a91b705e3a7c5d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-04-26 (Mon, 26 Apr 2021)

  Changed paths:
    M tools/jailhouse-enable.8.in

  Log Message:
  -----------
  tools: Fix mistake in jailhouse-enable man page

Reported-by: Dr. Johann Pfefferl <johann.pfefferl@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/95cb81-e0ba79%40github.com.
