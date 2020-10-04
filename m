Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBB475D5QKGQEC2JLKUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3d.google.com (mail-oo1-xc3d.google.com [IPv6:2607:f8b0:4864:20::c3d])
	by mail.lfdr.de (Postfix) with ESMTPS id C9358282C5E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 20:08:08 +0200 (CEST)
Received: by mail-oo1-xc3d.google.com with SMTP id g14sf82220oov.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 11:08:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601834887; cv=pass;
        d=google.com; s=arc-20160816;
        b=NPpsdSpmOzOE+5kcCD4rk7Bd9PwvIuCGh6p6tm8GymgKZhqeFt9GvNpp2IBYzLK48I
         UrlKkN+bDL+Kjy16RPou5n/lVcIYwwdEFMd2CvgC6o1x//SpDskrmGAr9ML1M8SdPTyM
         WlVY9gu5pNMgpfgCTKqRgW5uGypur0YWV7lS71PqO3WWmIleqnxoWGPFUt24sFe3ppY4
         j0NZC7+U6CyOCsQr2JhmuOFUdrX+wlOWWA36BKLhk6VRaDBAnX/gWYDIt0qjx3/XwC1Y
         Vyrt9uKPxkZPZNsycvKs4o9Tif2gtLTRCYuPM+bH7Kh43O0ZkN6XaCO72o8iwTHdT4AQ
         EqSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=q6q2RTZOWfygWMuN6quW4YSJErq3z6ZjNjvNvd+xscs=;
        b=LoRVac2V3Dnil8mzlU40M/Qdy9NThr4z9zIUznI7LqGFq34ZzKqr/qvZHocCDoZ0Ks
         iI34qBI+4cWWnHYjsKl/bM9GKgfd3pdQFwjyo3bkRE6uo74nhdPrhtKCo3zbA2P704wq
         +1zBaLTykifC0hQde2smoLR0n6EfSpn7fTx+3gqgxYdifhKhWi8Y+RY8PQGNbn8oxeCP
         DJpwO0un3hv2byVVDaBq7bAgnAwO70cS1oYD5GuhZP5HeQbfvzRATxyuytW72gTXLtxS
         WsAdL5gZRGBYdoJ7Wza/TQGx1JH/dgNIhX1xOY+2zpDReuFQrV4JdXHQ/gYilSLg2uYN
         apgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=OLxj9K5N;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=q6q2RTZOWfygWMuN6quW4YSJErq3z6ZjNjvNvd+xscs=;
        b=i+RKcFszZGFycQb3MSjbYr9cCp2hVkxA3IEXV+vqMhubwmLwp8hGrVlh6LldLXEj35
         0rbcLmBjCQsojd/EuIciiRSSuazvvEJVG3WlVnhQ0oXi/UiRl+n16zk0r5C8Lc/SDbYu
         4VU74IJ5rtlii8t52fgkusefCfEd4/Skke0B4TzI5ieUYixRxLs9gKsYiKmThGpYWDbW
         HdMro7jGJSkLhVMkMYelQKkvhpnNUT5yLGTDsjRu0ys4wTNLLPOo1R0dXx4FpTbQVFxK
         CAiVBFMtAUbMFStE2ODM66nE9hGqXVGU604IOLUvPeMi21lekjzryy+39x2mjwKdh2wi
         vd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q6q2RTZOWfygWMuN6quW4YSJErq3z6ZjNjvNvd+xscs=;
        b=oldKjnXVPXZVzGgyVe2sM3viOxIgsYb2u7jXpO7RQ2Wy0ekh5P/NVlhbk0cD4Zf0sM
         xXNe3dXBaKy5jZK+obIqbx1hgO8g95GW9pVVjifCyU/3zpzXBtG/InILjOdiHjME8yfG
         XD+ipNEkq9FwJvCt71maJC/hO1TItY9vyzwA3+JNBPY2ZUkb1DFbJmQa3Fn5y1V69Qmh
         rO9Eip58Cg5fg+9M+2DKNnIbb0KY9NNhobJyz60zwPI5xM8RgKXOA/paQnX1E+uOBf/y
         9LgKAeMEDqkXGpvMpWFoo3gZe6+K+nlbT3dBt4EpMsFyM2nXh4c93KYCvwwF/2Sk87HS
         fxHA==
X-Gm-Message-State: AOAM5320qPFzP9MesG9CyD+8tzfts4zo6/CGz63hRZwnmz9O4VpaMacw
	XrDqc6b7OCOtpDVhrKkkhmc=
X-Google-Smtp-Source: ABdhPJxbX4lWuTOVgFYTCTf/6Neh3gmrX4bQsblLMqKGbzxpOMiaAkrxglMKmwlfziuEPR8cgkEZCg==
X-Received: by 2002:a05:6830:1e19:: with SMTP id s25mr1308110otr.294.1601834887341;
        Sun, 04 Oct 2020 11:08:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:e154:: with SMTP id y81ls127722oig.9.gmail; Sun, 04 Oct
 2020 11:08:06 -0700 (PDT)
X-Received: by 2002:a05:6808:183:: with SMTP id w3mr6589285oic.176.1601834886579;
        Sun, 04 Oct 2020 11:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601834886; cv=none;
        d=google.com; s=arc-20160816;
        b=P0ZPaA4YKhfXnkojZeyictYZeMS99htEqO7XK5wukYNyPlNbXyPKVPS7kywttXrXHE
         jhToEKZmVbc/YZaI6wl/lk4coYkoXUyC1O6Xje4+MMA5gEAzmoIaHqsBmgAabN2Cf5A/
         4p5qKSF9P8RO/kfXUbxJRI2A611/ms2K2PlO/mtF5y1d81cEQUOJQJxLVqVVg29gpb3P
         sT4VP6y4uu7FiNGodKKiTPcQy8o7KqJQ8pQfkdRe90XId8duAscttzAlMLuD8vp96e6L
         Zbd1s7E458fo1ZmUCrexn9h7tPg1mebc2v9/QTYolmu6uEMXFH1hp57uM5dFJGGBUmIf
         yYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=lBFffC734KGKmI/LP/lTX/qP1ZsMXPlGwPtcym3bfIfXELSp/CD/c0cv+0l0SbWvYb
         YrGojEZCYjxlZ9sHwqFKHvXvk6Bic3Bs8PKdLciffuwqv3cO/2OZB1EXxmh1zSKYDoes
         EX8suWKa9zOAtaQCEDCtfH4GvLynBrvk13C7awTVLYUxi/1eTemGb41azukvEkLeq8Ko
         seysIB050ko1krW5qplTSxOEDhWHoQSrAxo0OmwggVN+qgOffzxWu3HT8nF1LQXZoKVG
         FIyUeDOBtCyphLHwv0H0FFgsz/qDlvnrD5TcGANUB/oUeYs9MbWsO88aAxBLqv+jZc4I
         wTrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=OLxj9K5N;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id l15si992665otb.0.2020.10.04.11.08.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Oct 2020 11:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github.com (hubbernetes-node-641158f.ac4-iad.github.net [10.52.114.55])
	by smtp.github.com (Postfix) with ESMTPA id 26ECE600761
	for <jailhouse-dev@googlegroups.com>; Sun,  4 Oct 2020 11:08:06 -0700 (PDT)
Date: Sun, 04 Oct 2020 11:08:06 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/3e1ae5-e0d420@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=OLxj9K5N;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/3e1ae5-e0d420%40github.com.
