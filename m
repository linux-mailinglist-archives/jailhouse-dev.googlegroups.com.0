Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKPLRPUQKGQE2UKGCUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC861B60
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jul 2019 09:50:03 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id z1sf9835401pfb.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 00:50:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562572202; cv=pass;
        d=google.com; s=arc-20160816;
        b=YMMmZD/vzsyPR4cSKvnVXRVfSybOI11fV0PWnWxwKpvOVTTtORRHZsFisLmFYEHY0B
         9P+uW7qHZd8Bckd8fKIanNCS/uDqP4PW5s2d/Qnetp3YdEkGVB4LS9bniusQqgeZrS0b
         4Tb431Ilj0ckoc+whVhOKlf8RoIza3qbEFXhfKGE7JV1L1aKtHCuC7V5SiYMkvso3k8V
         8CJ1usQJ3SyuffQjzKBNnQSlsQs9VovN0dIFML8nqcztizAmKfYbrGdoFE09i92efp6I
         LWDDwM+mrQX3d1uB8rYl7uGNBjqy285JmmWJbF1d6GKGId0NYSb8rOL5YdklmWpxs7J9
         hRAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=2JVmhS0nBC1+za668RMFVARQVWbO1vtdJb4f9amKHKU=;
        b=lSJMNq23MLyleMxILl+szI+k0LwdcdLfFCt7TId6ahtTJ3bkboqvtLjGDDK8u21foy
         oQ1eQP8pVHNa9zO0ZjLmhuue+W4Tr06FbWyZn5N4G56jWPJP/QRu+R14SlmFTJOgQQaU
         CnEA+1X+r3Lon/C0Zk7ZM3oK45rI3/ehMPhbxrGL2vCJVC9cwbOTGi/IqxGvx0gijQpd
         UV34IhlnzEUBWKksFIySpiI6hYFBMVCJME4a308sz1DpgAVh03KJCKNdMTXprTjhJmv+
         zPJfe7tzI1kS5TOfzhkj07JrlPnrTdwYnHzPhXRnocsZoW1U3htnz8M8V1J34xm1Wfyy
         Ae5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="OMo5IKC/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2JVmhS0nBC1+za668RMFVARQVWbO1vtdJb4f9amKHKU=;
        b=bomKXvCiqj0RXS2eS05zR26Wz1wBcDS5QaTUa78UQo1uNd5OAa/gnWO1EDXmHqRYvn
         U0s7U5Hi0Ev2nKGVM2IAEREwDrhjthp3HIBzOc+wZxN6LZYngHNFg2cS3i9mRAlqlvNc
         zLumEqIPkVKJdsDNHHGu9i5ik+VFgLOd9GOykk46S4vzbMwA6GaWhPN9qYFzgoVP4Jj7
         qzZwIRWWAvm//wogoi2SSAnvVVFqTcQ06Jki8rdHyLKlHG0rAtal53hOEqVzAozsVI+n
         RXZX0nfqj00VfyzWIHH2WFRjwLOIti6Zu1zJhjd2jLjb1TPpJlCinKCrxmkZcgRwl64I
         aOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2JVmhS0nBC1+za668RMFVARQVWbO1vtdJb4f9amKHKU=;
        b=HOraDbrGKu5V36IoNnLqRMQ5GnSMAOq74c4iwkM5dQtaETYDLzAnVGRhetYCtreUOu
         YOcoyPsAphKTpyRYWdCvqYqEIb7byxZ8Wr1QdThokzuvtg92nyvIHYuPH2Bz6l7uwDiJ
         YHBTireEhxGvVfTzPWDOv3xS7kZmln4FXy3kDnT7HmU7TcwCmO5H4ETAdHAopkm3fi+0
         zFIAqNTRfCF1FKAvxu9PzxTYkBchjPSdWEuuv7IncYkXcWWotd4y8jSXdGc3AH2z1ZIa
         hEjq9nr2De0qgNLo/8u2UgW7EGsbwSoo28iT7EKBdFim8VBvlEwckYlT41XT3Hffdup5
         dzPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW0PXHOpjygHgvFXCMsbAadNErzLe76KTz/VtEuZS1O/Nfzo0JW
	nCEQ37XGz7l08dXhqavB8Mc=
X-Google-Smtp-Source: APXvYqys1OlbaTJebCV5vsTnl3XELvrcGVVcqraE//baBZIlCSZwqj6Ve76R8vvNww4xtYABWcetgA==
X-Received: by 2002:a63:7a01:: with SMTP id v1mr22168881pgc.310.1562572201944;
        Mon, 08 Jul 2019 00:50:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:26ae:: with SMTP id m43ls2118103pje.2.canary-gmail;
 Mon, 08 Jul 2019 00:50:01 -0700 (PDT)
X-Received: by 2002:a17:902:294a:: with SMTP id g68mr23194469plb.169.1562572201253;
        Mon, 08 Jul 2019 00:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562572201; cv=none;
        d=google.com; s=arc-20160816;
        b=qjeKq1ljOsnaeUDH3xVQASIR7ZI7C/yuaxAg02FE700C0eteLWyiDt0FshA4r86ZZU
         Yzx7bdfT/DL73RA7GMng8NNhIP0Ue7Fnu65FWXwrz6uPhyzG4+F9lZtIsBtDfhYUt/fK
         xvSXbWGSsiHIxxXBhwiEN9WJb7k00ASO454NAuM4pkfagjJVOihxyHEs//RfcaKKV/eW
         PDojwxpmiQfzKJDjAqSi5KFNkVm9ndL78Ba0dK03DukItJKpf/rnKAluapeue2nqyA6u
         Y+YXvI3f/i67x2HdBo5ErHEu7Ijs5tRovdIwxyLhOXU/UW/N1iR78pQKVmfN+CsKRcwS
         EozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=svHURYOSuTMiAfnzrM5Es06iCQ/MosQSPeOxBiIFsCs=;
        b=YxnIp/OacflMlFR80XL5So6OPTucezMbkqfGl2Gs9r5ZQwmwRYNBngBW+YA0Ar05Kj
         aw/5sLFEmS9CjbaNJ8AUW9ECo+iQja2Ry6C9VaumCnbtcd0EkAamHmBHyrOsAXk0+fPs
         yhUAQR/kwuHJ/DOrfmugkgfXtUiOFrGQ2vxvAhiGxlxRcB3oAslUFxwqSA+/vz9ZVEQZ
         yWOl+LWDtgV7BkFR1nejbZhLJRfECplGBYueHc09/24s5Y3I1aX8Nnn3T7xUqg+XcLAu
         8aeZyKoTOYuMPVlA6oQqIvnJ07uhXmEvHIyd0dq5pvtTA2o8GqOSJrvs4i1Ck573g01n
         FSeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="OMo5IKC/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-16.smtp.github.com (out-16.smtp.github.com. [192.30.254.199])
        by gmr-mx.google.com with ESMTPS id w72si772037pfd.2.2019.07.08.00.50.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 00:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) client-ip=192.30.254.199;
Date: Mon, 08 Jul 2019 00:50:00 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/tags/v0.11/000000-55e53c@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="OMo5IKC/";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/tags/v0.11
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/tags/v0.11/000000-55e53c%40github.com.
For more options, visit https://groups.google.com/d/optout.
