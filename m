Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQO6W35QKGQEUNKZXXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B927832A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:10 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id s8sf802356wrb.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023810; cv=pass;
        d=google.com; s=arc-20160816;
        b=m2OrwMc7mEkGFEgEStGjc7f6Y6n4LpeRn+rE9x8yS+3Xc5KfO2hkaUFwVC/v8zixdY
         d15Cj18+r2LnkaZWm8s9sy5FIuf2j7IWWYS8FZGsoY3xSClELwgD2/UZxuwlSsuG72qy
         W2akyCvszJy1ulWMsCpa+qfhbg32sUALheFlP86pLeVFxp3w58nAGcHTIMSzTt2Orkhj
         dXQIaV5onQb7SWpPZ+i1rrWFpeYEdsOLaVVS1jteUHZXwyBKxVA+mwLtXtqyiYCa3s1z
         WnlNSFrodMFuSALw66e15jUEbX8aSRNfAqbeCaNrCtpjUpFtq9QtTqfikL4/xWR02zKn
         JchQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=3XhaDqLgVqhjUqXnpkA/c4A0liVKuVx09UX7WVdG/d8=;
        b=pcCgWxXmxA4HJMKKNNUzKYYedOs0eXG+SrBDS3T/5m6i3KYs2i+Z5UC0J709l24E4O
         L/ezidyRqrSTbTm/2vjgWvxP4eX+TWuramKYCozA0NDoENOOGzrN9wRrFCY2X3pNeJ78
         tm5mcfHLvWqihKWOSgYNn48hfDFVTYL2UOWet3GEjP7JmtMaMWgU6EV9W7XyH6GVO07A
         4EfNnRlC+vYa9H6KGNKHVhnuHHlVixVGZM4J2byU9qlfZT/5Sg31M/69Kd749m19/xXM
         7h3L2TmutloRm6XnMBpk2Id2RyxRchY0+cKq4vuhrhoTsEFWBt3/TEQBIcf80gK/HwPA
         GSdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3XhaDqLgVqhjUqXnpkA/c4A0liVKuVx09UX7WVdG/d8=;
        b=e4mnzKG01WwhaomZ9LVqC273ZZp2Mhghmsh9ldyRrf8CowpnH+ozLE2unOTDnZsXba
         bWBEa2dLr0UlAGViiscuUVRw1MkmIY6k7OlTLjL+JIHyM2nwGfv6KMqEJmZ2cDbbu7c3
         ucirzfrTSScIZffyEdR2mHJlZki1cuEJRjuX31RYrWB3OZC5+pxT/x96fbnCNZCO6Kin
         8WEDoHNqCYw+g0nH1lUETYFKeOTuZ1HZnt2PuJH650d56cyZmolnXs8MjG+tlRRMd0kM
         fiwvMIcv3hOy3OGNqeAd0cHgTnAPQluvoaskQYByqLJ84uJhiU+bublBZwNfymgCUCli
         5CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3XhaDqLgVqhjUqXnpkA/c4A0liVKuVx09UX7WVdG/d8=;
        b=LhJQEKgw1WSFLO3IdTOSnwaP9qC5ECDF4H79/r+gGcs7b6zUV7LRgpt/yMgj8Lylbj
         76vB1N6KY+k3iUKmu1wq/XJosPbb8el2cgvF817GYgOs2WL8p+2KgQiHNsle9mmYiNUg
         V8lN8MJDjIyv2wl+lAZoo2iL17LTw8XAVOpXab82NFG3s0iSvImRh1Zy3n6CbBmzD78u
         Dqm/RdrFkVNYgCLZuF12mvARHtPhwRk/6EXHghDHHUuadV/vzpuhgF7KPeGKoUj65A0A
         +mCwkd0WSlLg/KdG652wtZuv1vv6O5kR8THHrbVs63SYRi9aJXa+7VMr83YkY6O7dzUK
         NtcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5324ev2rAOtsiaMUl42L3pSqcUxi6pTl/ujPBgOfrJC4MDAw0EAL
	zHuLSl9CZNZay3JtkPKp678=
X-Google-Smtp-Source: ABdhPJwkVpC6IRytUFyDx9T5nr3/ZrNHyUTFjQ8Zy+hvcoawzse8Nb+ouY0A4vcu7T0JLcoHEhENmA==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr1986285wml.145.1601023809965;
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4154:: with SMTP id o81ls839888wma.0.gmail; Fri, 25 Sep
 2020 01:50:08 -0700 (PDT)
X-Received: by 2002:a7b:c847:: with SMTP id c7mr1953293wml.149.1601023808759;
        Fri, 25 Sep 2020 01:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023808; cv=none;
        d=google.com; s=arc-20160816;
        b=w1v/x77dO7VbES1aw1hhueizOCQh5pMSqpj6W1dgJucMMZ6NhU6+hwkgVAGImF3PlD
         kqjrMyUhaAG5wLUxvYpD8yrt8d9EGCTYpfH7IKvYcoge5TTboE3z7lN4sNtlwZTuTHfO
         WBGYvKPSQS/8XeS5EuEe1CVPsdmC0/OCYI5JsAN41QuTJJuV7iLNCyh1Vhuhv+5qOn/K
         G1ds52/8Qav4npdZT3ZArUuA+b0glM+IY6t/5mqzY7UDDpstgs7KAdYha2uZesUJS7+K
         JPJwdsrAy0unKfHxtAVOBv6HXYaAG9hgMXPn20mlg0jN53ks4HfB08436LvLGSySOGsM
         kxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=DrSqux28nqTijGLhaaUybAqGcWutK3eCcDf7hE/9txU=;
        b=MdvsY60eG595+vq6D08VRz9NZGcz6u670LF4Tf5xasA129zXB84BCJCIvvVPP25Qpt
         urOTmVl90n5gbrcFPq4k5a+ALNme7/gC15AlcIaM8+Pct+LzWAQwkEPtqqbjHFNeiBHF
         X3T7b4wB4X3vISXzMelQZ8d5ccQNfQC4zqur+JwX6HGMZPUxjtEtMZDGIhHXsYl4zpX2
         PH2rT3gdfLXCoebGQ1yTU0zs6LW9c6V3jW3mmqFvrfNblskA2GjVWizx0qUC8SWIMGqT
         fHaCXTcAT+PZC7rXpL7f0S1EFix0R9bkSGADOJHfmzV5zAX1racKWSjkJA4MYfZqmp2u
         ctBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z62si57459wmb.0.2020.09.25.01.50.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P8o8dI004926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:08 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IH027224;
	Fri, 25 Sep 2020 10:50:07 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/8] arm64: SMMU500 cleanups
Date: Fri, 25 Sep 2020 10:49:59 +0200
Message-Id: <cover.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

Please review and test carefully as my current setup (Ultra96-v2) does
not seem to be complete yet.

Jan

Jan Kiszka (8):
  arm64: smmu: Simplify __arm_smmu_tlb_sync
  arm64: smmu: Allow arm_smmu_init_context_bank to return an error
  arm64: smmu: Clarify that mapping mismatch is just a warning
  arm64: smmu: Consolidate translation stage detection and reporting
  arm64: smmu: Fold __arm_smmu_tlb_sync into single caller
  arm64: smmu: Drop duplicate error messages
  arm64: smmu: Handle arm_smmu_find_sme error properly
  arm64: smmu: Improve output during setup

 hypervisor/arch/arm64/smmu.c | 113 +++++++++++++----------------------
 1 file changed, 40 insertions(+), 73 deletions(-)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1601023807.git.jan.kiszka%40siemens.com.
