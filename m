Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNPZRXVQKGQEVUKEBEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E709C971
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 08:31:18 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id b1sf9198872wru.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 23:31:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566801078; cv=pass;
        d=google.com; s=arc-20160816;
        b=PWJDmUNUhD4NNvJtH92g7IbfSzulhdozMYD/ZK4NCRhYDKqgrqeokbu+iAGrWGEtn/
         FoS/wv+1sL95tWwOnw41mN9y5AmfEp4TTgGj/k0ExxTvyZ26F52SafAoa5Tw8+aWev0g
         PgfQ+iHhcy2mr+onKY+2/sEea2TTiLdA2Jrx9HWL3f+4X4UYBl68tNe8id6TOr1ZY5IN
         go0xdQpP/8KEvrp92id2bzUo+znHNa+pjPZ+watqqTui5ecmVA0gUtZyg9urH4B2lL6I
         R0PO6cCmfaRf1w1j8hhKMUVBnmM7fT7d2Ezn2SgfVZ6EctBOoz3bBJWKwO6RqDUufKZI
         82XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=NlpUzLZwCS0wCMU7AlF161nlVw4a5psTD701i1Ded/k=;
        b=hqcznU3/AdhTW2a5c5bVpJXmr+a8GmttXxAfc55bT3rF6JzHHAXS7PkVsPHN9XXFN6
         9WRj2Sdj5YIz37Z+pSVpeAYRKhxawwS0wkyl7T0TpS6vJCI1619BPCbK9/sXgdXwvF4q
         oD6SS56S7gjXw5YTXkUzOVIi1pH20XKr7sAIYAoUqrc3iLcglweqvaB82YwFI0hLU3OL
         d4C/BwgO+tQJZ+D2xCQsHtL6Vy+c8IbzL7NVsv1/5ejJMFvIEvWcZbPFGdCRWK3okeIX
         KiFRJdPYnppfOrpbps3n4xEGHQlceEzvWz3TpK19u+FNtxvgxscQonV2PpwK1WD3dm3C
         d9ZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NlpUzLZwCS0wCMU7AlF161nlVw4a5psTD701i1Ded/k=;
        b=amCyvi/k5F/U5ThB1GLtRUozCIVJotFCNs/cqYXHJVQSNaptmIBui2unBFQtdfxxSz
         LbKnTQGowNtK0EJ8emB4L78aU9nDSjzaVM17Ii6GTbGU+dn9SiZZV8Rx/RuItraabayV
         Xf9yqFiJ8WfTCyc/V+JR64qlcaGrxmAPljWB07qRx41xwSRpAIcmbPlRqyGFqKQSZO8I
         r44e4DZ7oN3khu61SXfNSWkhB4lkxzlmcoTVuWpGShWDZgIN/krbR6Uv5usSX+2jwxX/
         HYgjRPTWjXkYCf0gMZwMOUV4pokPJEoDjnhUk5mGtsr2WwW0rIseX4/YLUTp3nAvq2pe
         MboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NlpUzLZwCS0wCMU7AlF161nlVw4a5psTD701i1Ded/k=;
        b=Zj4fYPcMNxDEoe5vuF6lWcwtKZusxI6P3JtyHNS8rMVE45X0fwW5LvJjYloCDsiPKz
         Ks4StqXQrwNFeRlZvAle7y/x67NTTMsn5HnDyDlD4KLyPr9a+VT/kTlFpEzB5tiWOb3s
         Cs0UJPfKDyu0sfctG6gxAXZQUUl4lYmS26sir/xD0zsWGt64y26L4EjN2OGKOcTaDL/K
         nWEnq3xn9S6kLSOdHFGyRErBIY07McxnfoTJyZD7biz5HHcLAt4ekn1qxwZQ/QG/h9qD
         nihIKU0wPCTOIMNQrHOmPPtVnuJ02FP0jgUQaY9wW1VVvC30yNXI1gFy/mJN/LEU9QP4
         IRIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWRcYGAkn9xxK0J1EWe55if1gk/a8Rl8MKTJDr+2NVMyetPR9+a
	pOxAsO/jHGHZGpR34iOkLGw=
X-Google-Smtp-Source: APXvYqxpMexolzLFRxBac4TFSmuR2esSkuKAHwe4VrZhg/Xc47pLji+UU/v/F1efCdMvWgTuwVgHFw==
X-Received: by 2002:a7b:c241:: with SMTP id b1mr20260534wmj.165.1566801077948;
        Sun, 25 Aug 2019 23:31:17 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a745:: with SMTP id e5ls4147413wrd.5.gmail; Sun, 25 Aug
 2019 23:31:17 -0700 (PDT)
X-Received: by 2002:adf:f304:: with SMTP id i4mr21642401wro.61.1566801077349;
        Sun, 25 Aug 2019 23:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566801077; cv=none;
        d=google.com; s=arc-20160816;
        b=BEeG0WTZxDIgF/xRLi8v/y7QLxoM+lQnAaWCQfA/oXm56LhRMKVUJOlC7JOUKtpxyK
         UbHP3EgTnPrwU6cpxYsL0CGozZNX0RVDFcmzJqEy8F0ljx5A+8xyaVWnxGy2kaRQa5My
         z0jmrjZuJDlUMbCR9Qqp4MbBBsNDHNIMA6MadLWDwacmoU3P4nE666pYGi6RMbVA0NKW
         JbTvsZz0hSCUiAChAzH4X1L1gZHiI/oGUHMC1B4inXMyoZMpRpkDyNqhXYGfq52tjoi3
         1IZiLBLLsWCIm8VsiBido7BoPXWVOQkTtXCmhwiWfhFedQtikVskC1qnD6eNGkN8osW8
         /TNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=F6/l+lQCwl4HMd7s2G29cMWrwmgnt+mTfsIdOjjBI7A=;
        b=TAiMbcV5Fw69KKKtyV6sMBKZPz2BnCCbCspiRDNzNdjpCA06aBwlkT7GtqFf9GtayM
         b11ReykH9lee7Ewmkztlc5DLpGM9AM3DxGBIAfMlwPISL2D3ieULa3jmk67OUgZt83zI
         0WwqKa7+m9KFuMCOS0wrubPyfGji2ETm16VFjGTW2GrvrYGkc5VhNH2yqI5zw33YvX5r
         ZRuMjM/8GleEi4+g6kY5G5NJrB3/KTwkaAXslVKU38/2dqzoKdZAQvyaByUu4CV/yFLq
         Qm34ipt00uFrUACyVPaBzypDYIUVkWCQnycI+yYBOk5fwRMwG8B9LaF/E0AoUIjVFM/y
         zHPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y4si540595wrp.0.2019.08.25.23.31.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 23:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7Q6VGTZ026983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 08:31:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.35.99])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7Q6VGMv024227
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 08:31:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/2] Build fix for --latest, kernel update
Date: Mon, 26 Aug 2019 08:31:14 +0200
Message-Id: <cover.1566801076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

See patches for details.

Jan

Jan Kiszka (2):
  jailhouse: Account for new PIO regions in configs
  linux-jailhouse: Update to 4.19.67 and 4.19.59-rt24

 .../jailhouse/files/linux-nuc6cay-demo.c           |  6 ------
 ...ux-nuc6cay-demo.c => linux-nuc6cay-demo_0.11.c} |  0
 recipes-jailhouse/jailhouse/files/nuc6cay.c        | 24 ++++++++--------------
 .../jailhouse/files/{nuc6cay.c => nuc6cay_0.11.c}  |  0
 recipes-jailhouse/jailhouse/jailhouse.inc          |  7 +------
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |  9 ++++++++
 recipes-jailhouse/jailhouse/jailhouse_latest.bb    |  9 ++++++++
 ...-rt22.bb => linux-jailhouse-rt_4.19.59-rt24.bb} |  4 ++--
 ...house_4.19.56.bb => linux-jailhouse_4.19.67.bb} |  4 ++--
 9 files changed, 32 insertions(+), 31 deletions(-)
 copy recipes-jailhouse/jailhouse/files/{linux-nuc6cay-demo.c => linux-nuc6cay-demo_0.11.c} (100%)
 copy recipes-jailhouse/jailhouse/files/{nuc6cay.c => nuc6cay_0.11.c} (100%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.50-rt22.bb => linux-jailhouse-rt_4.19.59-rt24.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.56.bb => linux-jailhouse_4.19.67.bb} (62%)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1566801076.git.jan.kiszka%40siemens.com.
