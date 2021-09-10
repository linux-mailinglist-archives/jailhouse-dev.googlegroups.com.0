Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJUQ5WEQMGQEREEITEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058C406B13
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 13:57:27 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id n1-20020a5d4c41000000b00159305d19basf432295wrt.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Sep 2021 04:57:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631275046; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z9w8pCSErE2fLrY2hsyfNMqvj08kKTNgUyDzddr/1TzKw1VgDhKry02xveCm37DHKy
         L+zwwxfhUtFLGgFc1P5I3nnfUn9XOH2DP0BrgDlqFgXfCjMSuJpt0eS3FvcdfKuG4Lki
         vJS1cisMz10q6t1aPjEbysifSk5/dtfw/5qQaZG4Juil/thNLokD14KiU6kWkDHEsc7J
         F95uR3YlA//9DZJxxjCUVOrNRs/gJVG0TXLvgM3HTFOoHACYibgZKC14i7X6x5IUGL4k
         MM2E/TOmnNodcHUvQi/eujCUr1MvMBlZliAd4iT7JdwIE22ZBnCQZu+GpTAOO+UMazRD
         QT7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=gKXK9znk/c6ca0ilrpLLwAYadakVkNwL704qvqL4bDU=;
        b=05mMG8br91+HteP9D+qyTrIfoEbY19prKL32dFC7SR/zHk5u562ZNeupLFhee4gdcZ
         ZKSKKfnBEwklvqpV9yGP6YUiiPChVxJyQTKcUHbYjXbxJRM5zVe2uEkFYFWzCK9612wj
         khFQjRjjESERHROATHpt/ViophOJ5Tk1BNJpjI4XuTrnuM92CAjNmbO0qHpHKDmlsgFl
         0S8ohPJYy3+mJ+CuSyiK6PU37gNs2MNU1Ff8aHtQxaDSLT4mwU4/x5SWDcqFWJ6Hi4Vg
         DAJpGky6vDtOXrB0kn5u5Goepm+o8rSAvtLUMivLBV4lhLx3jy1H2yGMbo53FAphyqdP
         FYQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gKXK9znk/c6ca0ilrpLLwAYadakVkNwL704qvqL4bDU=;
        b=b48s7zapSBhVO+37hqr49MelsM1EJiyfY5n01OjyfJxCuEamW42nXgZBHg4h9ZmGDm
         g8O0TCENAl5tjLwCwecGwmbjvWpz2XR8ltVFIC7yzcQB2RDoqA6h/2994WpxjAa4PypG
         UW8Kh4zPF/8h+a4jzBhgMYSGN3GUXllfwxPIkyDj2Rm2/hDqdUbfvkYKBG06cZRY5ndd
         CnnD3DgKP4iJpr+TeN00w3pdxja9Rsc0y7isNTRv/icm8wkNOZiPhwb7SWhrpWpB/2Wh
         djS6zKbFlgX6YEaMXwn1lz+Y+j/YgOjjjT6kaO7gnyJ69j2U/Nn1xzZW5lATWOgFWAcV
         MWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gKXK9znk/c6ca0ilrpLLwAYadakVkNwL704qvqL4bDU=;
        b=NbhRmDqG8kiWQH4aZM3GzPs1+asN3GzBv6SepWHUL2k4MVOtC1dMC2HvN6xHO3sAiN
         OYTuK6sYeMAGjUuL1FiMa7VBJX4QGBYaNyl5dQ6a1yv39PreQ/FRsq6z+8IT+sXAIkiq
         O/xL0X6afJ3gdZhn4+ND+HKF9s5+9z2W+TucxU9ahksqn6Am80OZFElJJrzgndjYL96U
         LY+LmZviaQc80JFNQWNy8B66HkM3u6ArUs5NPVYl0g77vrajV/I4JrI47uNLXXC0VWRa
         V1poF/cChxfim51G+NjDfjEvaNJPQcYBfq3Uv3UItLUcDcMPzsCWVr0lfO4On4SX19fX
         lq0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dvurssK74vYb2vTGEdbNOuCFbDKC2GGB9WlqrRTv/v+PTpfJL
	JxalyJL4yESOi06qX2WYNUY=
X-Google-Smtp-Source: ABdhPJy0EKSL5tuOXOV2whCPnXFANo1L6AJoJi6q3RNuD6KXnXqcyIcrOELZwWfqlWMuN78XKlVSEw==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr7780636wmb.112.1631275046807;
        Fri, 10 Sep 2021 04:57:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cb09:: with SMTP id u9ls2693508wmj.1.gmail; Fri, 10 Sep
 2021 04:57:25 -0700 (PDT)
X-Received: by 2002:a7b:c442:: with SMTP id l2mr8104118wmi.131.1631275045682;
        Fri, 10 Sep 2021 04:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631275045; cv=none;
        d=google.com; s=arc-20160816;
        b=hp/mxESP+vbjyUsxlo5t+I3XBbmFLeN7Ya8sEihLfX977cpC9y+lEG+aCgoMTHIPBy
         KCLTGsKAClGcHW6SupOIkALo2/of2L1bPo/X8ATY85aoKDK9ZwABq7arsgegxzAGwArV
         591DhRPxTglsYhAuPq1H+MBQ5BKbsPKq3nMPZtwUlC2Y5xptpl8J8N2aaRPFpEZiWcQw
         DNY+ljCYkR9LQQVaofE7geWroaMSP1ET9IZ/P4ShkQvGSHaYVA3++BbGU57b0ZSWragb
         Dys6I4LW81r7/CKwNrkfg8tQybD/A4wNTXStreAQ1vdvcAG3th6VVBZtIGz3FJuGL36F
         9pAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=pQrE7GwOWit56SfNHUluJ9wlImKKZKGJLsYvP8JF/q4=;
        b=NsYERYKQqXrssOzkvXT4gbXzLcq98Eo+pyp2isycFWhwZIx8n3+rwfFi6n1svIDizX
         C94UDCSzvZUjjcvmtgDwIRXgzyKINO0LGPlezvR2jFR0ghJ065yikduvRNzOmEFSJhpt
         8YZMi2rRg3p3lbLwz4qCBgVNnYPpM3Tds4P9uJSd2HB+WiF+Wso/wxS82/Uf7/g5VFo/
         hL78IU39moTcpJ82851Rro6qMovVqI4x3dl+pj7QUHBOHLKCcrwwG1tGfD87l01da25G
         aRSfVXeb3lX425VF4XhVJ9uMhDB5k1u/bbeWWtg/rDmDZu+8D9ohHXyuBQKlHbwDfHLB
         IW1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q195si455290wme.1.2021.09.10.04.57.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Sep 2021 04:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 18ABvPma007881
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 10 Sep 2021 13:57:25 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 18ABvOCc007836;
	Fri, 10 Sep 2021 13:57:25 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [jailhouse-images][PATCH] customizations: Remove obsolete
 /etc/securetty removal
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: "Bezdeka, Florian (T RDA IOT SES-DE)" <florian.bezdeka@siemens.com>
Message-ID: <41429b99-ff08-50ef-cdee-32452149b25b@siemens.com>
Date: Fri, 10 Sep 2021 13:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
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

From: Jan Kiszka <jan.kiszka@siemens.com>

It's gone with bullseye.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/files/postinst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-core/customizations/files/postinst b/recipes-core/customizations/files/postinst
index cbf451f..a37d510 100644
--- a/recipes-core/customizations/files/postinst
+++ b/recipes-core/customizations/files/postinst
@@ -23,6 +23,3 @@ sed -i ':restart /\\$/N;s/\\\n[ ]*//;t restart' /root/.bash_history
 echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
 
 echo "demo" > /etc/hostname
-
-# this helps with ttys not know to this file (removed upstream with bullseye)
-rm -f /etc/securetty
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/41429b99-ff08-50ef-cdee-32452149b25b%40siemens.com.
