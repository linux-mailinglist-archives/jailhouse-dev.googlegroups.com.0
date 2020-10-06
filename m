Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN7G575QKGQEZ5DSVLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6652844E6
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:51 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e13sf287292wrj.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958711; cv=pass;
        d=google.com; s=arc-20160816;
        b=mJK6T7Nb4lh5VlzeYiXkJacatxzBW4DxQay7hmEBIiawSYYQNivAwthG3+kC6o7PvA
         f/qJQERUWWT1HXulOl4Ox4FCKMb6r99mj50m0fd1jOuD43YrVDfjfd9YpOduInRe+QBl
         Ial7Emf7RwYIc06tVrAQuYRVf+23AsnDVP09xNmdtVoTDEHEomPWnwSJjOyqTCVbDBb+
         0gFOW7sxMUt/w8A58GGQLIjBCRuxheCQCZ4QkXYepLJFzMqYP5eiDfz+6PEH/7l/QH4N
         VOKjLN45LDbUKBCj2v7ICGz1WXP7sLmu3dgXizwgm4mT4Rsxaok0FhDmNtWUBoPqBEBZ
         pUsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=mL27g8OBJ6L1J4zVg+qeEv8Lu4b+JUadJ46JA1uhM5M=;
        b=Z3cXIc4ll+7i6Q5ank54XSOfUohIx8ykZvGc8wQaT9sgmSxnq3qqfxPOTenQPNJ2c6
         3jL2QIzYlJq/95OZmYgol08cWs1/sur1pxs60xEcudovILmiG7TeeMsXzkrX+XwnDwTJ
         GxphpF43YJYHhMkRtyOBYsIyyNaLTeCoOKsVJTIZxfqtf/YIQEJd2XWiRuy2kGcPwORE
         vZX7JNlW+dDO5Brg3YrEJ7XY2wginIPUBorh3zFonkDwX0Fza7FIi/IpH5qHpDNoFrDe
         H3w0l3pm0RfR8Q9gY1W+LtIm7vter6OuOwb9YBtZZyAsFbt4MZZ0HtmFCpw7VpMg78F/
         J6Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mL27g8OBJ6L1J4zVg+qeEv8Lu4b+JUadJ46JA1uhM5M=;
        b=fyf+RFLg7LCWurlsBiQ+dNxdutXRNxW2ywwPB3zuUZTu575dHkrxeuqa+1sOGD3kk4
         0/7s3x04UdhRgE9HzX42EKluDpPKmpc5M3Ef0TzVQ2NNNFyckL5Q+ffZhhac2s43mU/H
         t200oR3BTc8k8bKibJirtQ9byNI13s+XXN9xAEO7N44TZRneEULcv8GTl5KuXuQVDtSm
         T/SazghJvUXjLbRM15hzKoPKyZo5Zqf16Mepk22TgxodYtqig/KjQYFHipVpy9uypU6E
         zUIN6itskt0e+pm1q/cTT2Fk/rm4xn/YRkNpTv/v3USzIxMF1RuK6j7LcGnfEt00zpQK
         kDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mL27g8OBJ6L1J4zVg+qeEv8Lu4b+JUadJ46JA1uhM5M=;
        b=WV8/yNode9rZgbE97MA33H1eczboVSgZ2WqE1igU3Cs1YZis3zPyPWCgnBPL0xQ9jz
         viece0oV9eY97747aEXit1swvCe+kHM4QtKk/rI1TWU2XfeUpC5NrrPveA53FwviiJ7/
         4dP+Fk0kdjel61XvezTSU98XBdy4xPADfdCr+pBNpjZkdEEsd4jW18sZax6ET4KxPK0u
         yO8Pf3aKtVk2HbXcmWwowEvLZb400VoZJsUeubuVvA0LKDiI/airoUtmXl/h4aocd4yf
         oIChbevxtsBsdMwl+DCYjML/l+EWfRcvEKJw2GnJyGUWRCxbQzAhPCrZP6UZ7VFqwG9z
         dD/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532RC7ORNiPINY3gc5w1jn4L7+reJjrTGxT4YrQGCyUxoYB/RNm7
	IpeMajNZo6TqrSwd5n9ZK5A=
X-Google-Smtp-Source: ABdhPJyxrGYRhex9Yry9in6TCYCA2SXyZAGWf8qH9UkZ292QtW6kLNpBfSaTk/SwZ6qI7l9/AfQ+OA==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr2801381wrs.153.1601958711551;
        Mon, 05 Oct 2020 21:31:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80cf:: with SMTP id b198ls527645wmd.0.gmail; Mon, 05 Oct
 2020 21:31:50 -0700 (PDT)
X-Received: by 2002:a1c:1bd1:: with SMTP id b200mr2626484wmb.171.1601958710447;
        Mon, 05 Oct 2020 21:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958710; cv=none;
        d=google.com; s=arc-20160816;
        b=HZbV8CHZSdHbJ0sNfSKQzT0jTC32HpE0WdJDxB4OzvXrMwuAoc41h6n6VjtZbXwCGt
         tIcFDkLGwGJq57US0YBtnl+qwknG7u1TMmsFuNxPZE4eRaEJzIfzqZmFQYcwbODSEyB7
         h4+PGaUR+QG8XTJdD8K2ytEI3aBnUOQq5ZZ3K/MQwj+IvKzRlPAb2mbXU+RqW2ixBmBD
         TLsJmzr6ESAa3r3gfUWCYvlsd1GVSKqmIIap/8rGukht+G5N+g+tNA+a2Urjv6OK/vGT
         duAQWmayzcR5bjuIozEEfR7860Vpu7cnQuNXn8pPcy5GrD5GTE0tYYz1WTDlpKRccKKN
         2dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=cbul76guFirs29PnCHx2IB54vNrtNIuoMQYIH8MAQio=;
        b=UpjYTP2Olos9isQ7ndCX8uwFkHTpyVxbPuMAeBFQK9UxIRnGOLBYGBYK3bitnI1lCm
         9Ppse+Mk7XskIlXXjhXxw+jV7uozHVFIGr0XTgzF+4VukuMLBqFazrb3dXi62hK7ytLp
         7AAgB/ESYsVfmj+H//jyHj46KKe6lR7ba+wrBMxC9Uq0EB/NMer5rOqOAuC1xD5zdA8k
         HSxAKa0n2j1Fwh6bqLG3d1oDeTBfecNUu+76/U0h7QJ5V55EzitSPLLBFwyyfELgtyDR
         yM6U0RJVTGrKPPsBrQa3xIeAzbSEXUvqXCb38k5HHa8KXSWQzetq4W1P5Ea36AfEa/ho
         zz2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z62si42692wmb.0.2020.10.05.21.31.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964VoXx028613
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7t008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:49 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 09/19] README: Add Ultra96-v2 support
Date: Tue,  6 Oct 2020 06:31:24 +0200
Message-Id: <293729170b61e82bd8ba7abf08313f5dd879b337.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Expand the section for v1 and explain the unfortunate differences in the
UART output. See also https://github.com/Avnet/Ultra96-PYNQ/issues/64.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index bb93821..44bbfb4 100644
--- a/README.md
+++ b/README.md
@@ -117,8 +117,14 @@ directly to the eMMC because it does not contain any firmware.
 
 ## Ultra96
 
-The [Avnet Ultra96](https://www.96boards.org/product/ultra96/) is supported.
-You can boot the board directly from the generated SD card image.
+The [Avnet Ultra96](https://www.96boards.org/product/ultra96/) is supported,
+both version 1 and 2. You can boot the board directly from the generated SD
+card image.
+
+Note that the configuration for the v1 will direct the UART console to the
+expansion connector, compatible with related expansion boards, while the v2
+configuration uses the UART male header as output, requiring the Avnet
+JTAG/UART adapter.
 
 ## Raspberry Pi 4
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/293729170b61e82bd8ba7abf08313f5dd879b337.1601958694.git.jan.kiszka%40siemens.com.
