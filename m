Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBROKST5AKGQELAZ2NTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785D251B3B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:46 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id a12sf3835984ljn.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367046; cv=pass;
        d=google.com; s=arc-20160816;
        b=AzHacu0SS0I3FtmmTzEqq3wmeFkweUsE5kKRKMDrmqXk9QUcQXnXodIeSed8TVSA09
         CFmFYhewbqazOzuA62jTd8JEqjiGEJxX3e+g8mzw2ipYiy/0hg+xXJYuXAPKx8RsUjyF
         b5ogs9BAIcPKWzKnT3TBSMLhjUsB4HcWwQ38xZvo81p41kP1/DhBdk/NYezzsew9EAxy
         4Fx9E/FdEbtukQtc/1yCWwd9w/Y1Pd9tfTzkehOBnMNmgzYv+WwRHEmHw+9dJJaOghOv
         AUOyDeoZ7bNKVUgZWhJhSSsTk5zU4mrcWD9pBOZN1LVGL799/0s7W4KINnjiZz1xTQTX
         9i7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=e56+nfxA8caLuVrSmIgVpOk1hasfIPgEAKiiglIvAus=;
        b=SlzGJMNMJkULalKpbkg6yEtpKoL0AW05fl+YKDJPAq1osUZZCorMombjG1TlRk+0X5
         fA84v12KpkCJGooe80ulH00aV6UZ3XBOxMTxWnTwKycCQS+lYWFKlySTuk/GWOoKqZ73
         DU9bL34p5hDL7qIfyF0XtfyntU8uhFAr+pBW0qooDfUOxawW7C1nlaJVwKbiFJZMzSFO
         daPQy+MGX1xR6h7a1TGDNPDS/wpF6kM8viUwyzsj7ew3ZQ9POEKeDNApsf1MT7+puaVw
         0DTj1xny4lRekpS/nZ5SwOg/nhjLG5aBoONVxQz1WZ/JucTrVaCgD1enWMfXtCUl4XfL
         OoqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=AYXOhnf9;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e56+nfxA8caLuVrSmIgVpOk1hasfIPgEAKiiglIvAus=;
        b=r1NF7Qt+qj6jUdeiqOjNfTANmpMXNL8OwX2QP/NQTWT8BS8N0PNC2/neETYmjeqIos
         iUas2pSiPzZAkU5TC9m1lu1gOIGQotjt56Xh3b8eN1flc2wYcJB4DKriv5JSY9AeKAxU
         EE2VVUTnybXnn/se6UugF13/7OrNdeeAvdGmzXHjWhuEWvA8FAPAv2EPzCFq2EYqyAWL
         kig1DeEty8HzKVrrfYpPFSqqRY+pXPERSI7Qr1FfP3KdXJneyCcPZWHWP8kc354eJ9LD
         NG39R0fCW2oaJMkPOanTtRKY+qLtuCC1yrZLqgWvEODnSApup4i4OoedDhMxEjBU5/8R
         0RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=e56+nfxA8caLuVrSmIgVpOk1hasfIPgEAKiiglIvAus=;
        b=WTYUQEEDwijIvACnT2w1aaeNQUy6nT08oO9Yso/Scqpred0NmnwRZ0qr4jXxGevMb9
         91aL1GgVr4yYx/PQZR93BHPACiet9eqyHzIsvTUBml9DT70Ir7sLCZQOmfavmxJRfQSK
         nXEvgOdOdDAYs8dCb/NTrVJnnbcUtGRKv9dgQd9O5ZmhrrNH2PIA0Vw8W6KPwOfzCpdT
         XujioEfTDGcg6xYPBcoRfzc94AKqf9VjwOn+4ovoIQYm2r57P06w4HfODw1Qd3nfJrFu
         S9rHXqCO3sUZUwbi5qHwagHpvvMbiOoA6rpIMyg7fK1qpClr/A7EMAsBMdZhE2j+SP9j
         Firg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323xSdpSbTNr9BftmDlH4C1gCzXsBkKKwYCgyLEHMyVqYQkW6Vs
	vxtsMy/iIsnCNJRtgXar0xk=
X-Google-Smtp-Source: ABdhPJw+zFTaQGe/MrR2PA4Ve0Mcya/Uq4vYjT1qGDeF4ll4cNE2YgYcMKvdEqqCT63xG+2e2RYUvw==
X-Received: by 2002:a2e:9c8b:: with SMTP id x11mr4613299lji.218.1598367046042;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:294:: with SMTP id b20ls2452426ljo.9.gmail; Tue, 25
 Aug 2020 07:50:45 -0700 (PDT)
X-Received: by 2002:a05:651c:1213:: with SMTP id i19mr5084260lja.191.1598367045127;
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367045; cv=none;
        d=google.com; s=arc-20160816;
        b=RDjm5OdjmogL4C6BQP43isNNM7e40TILFlVIN5vcv9Dl93GyH3aqDyb2Vpt26tu70j
         UNwyWtk4p0EKF3I1sJuXnN2nxNAeexZy4g7ZzVayRmVUL0hcyi1dYeMr7XjQQ4bL17ED
         W2ua+DNla2PF3GyQMCc7tUwGB5P0KaSaUHXgcJJ4K/n4ylUwUBNmJCczMpbQKMEaGbFq
         dO4g4iaXTbMG374uDFALOZEgzColHMowkcPk9+5uMnBD4hSUYZSM31Aurse8Cz9On88M
         Yv6XqfKWkjo5XLTaV7qutU1sVESlVpXlVwq0qgMNU7KNa8dQsbZqwJOWiwn1s0DsxF+/
         N9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=7tb0NEVIo0yX+oEFDnZA9XLny3JmDRhDnFihGuZKaOk=;
        b=MCP8pOjaElr3fh6/J6wkWMt0WgRMnSU8atOcGUQldOJKTy9lora5vq0DJISoLe4rUP
         Ps28bXUACOlH/RvCctKBf0UN0uhH3ayx3V0OOI+ZKetdvifS//tcW29Pv8CjeQ2oHyvq
         Ykj4lhcGwh/e2b9XQlGXkIRz+RJXr5yE2fuLqrroOYLGrNZrZa93pf8cIVgcexgz2O/Z
         Lx7eb166Mgtuovk9zxZWJu0aJXeL/18pgk03Wu37zHY1h/xZ7S+zVA+R1SlADoIHBXXU
         K1XhQPbiZO+c98giFBfLlxX+150A4SK1Iky4vjGcFa/rPKQeQUPVaWu5IxNBkr86Tf7B
         g1BQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=AYXOhnf9;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id v3si223677lji.6.2020.08.25.07.50.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3m1btrzxsR
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:44 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:43 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 0/7] Configuration parser streamlining
Date: Tue, 25 Aug 2020 16:50:25 +0200
Message-ID: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=AYXOhnf9;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Theses patches mostly improve non-functional aspects of the Jailhouse
configuration parser. Logic for unpacking binary data is consolidated
into CStruct class, which all parser classes are inherited from.
To improve input flexibility, data slices are replaced with I/O streams
(see Pythons 'io' package for how to use them).
Finally, a CPU set check is added, which will list conflicting CPUs
between cells and also usage of non-existing ones in the root-cell.

Changes v2->v3:
  - fix config_parser usage in jailhouse-cell-linux
  - fix output style in "CPU checks" commit

Changes v1->v2:
  - reference class variables via class object or class name
  - drop implicit PEP8 formatting
  - dropped unused patches

Andrej Utz (7):
  pyjailhouse: config_parser: store binary format specification in
    struct.Struct
  pyjailhouse: config_parser: move parsing into class methods
  pyjailhouse: config_parser: consolidate binary parsing into CStruct
    class
  pyjailhouse: config_parser: use I/O stream instead slice of bytes
  pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
  pyjailhouse: config_parser: consolidate header parsing
  tools: config-check: add CPU overlap and boundary check

 pyjailhouse/config_parser.py | 296 ++++++++++++++++++++++-------------
 tools/jailhouse-cell-linux   |   2 +-
 tools/jailhouse-config-check |  33 +++-
 3 files changed, 215 insertions(+), 116 deletions(-)

--
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-1-andrej.utz%40st.oth-regensburg.de.
