Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCMPR7UAKGQEJQTYCTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF7463AE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 18:12:59 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id f14sf1317785otl.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 09:12:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560528778; cv=pass;
        d=google.com; s=arc-20160816;
        b=X9RX3PyEthpAwKClbO+89wjCUOHOMpeC1EhLlKMZJTSCiFWg9eJr9g3F55gBmT3jkQ
         qkWCc7kaMMSH6hFPAP4cVU79ZvbJqc0gJlh2sE8iNUAzc5HVBJ7wluSETm8HwMJ8GO1E
         sj107Jv9jbD5ctqS/TFqJzNL1OkoTQG70lJ0hAMiAzLqqrj2qt8BRSWygsmnvLxXrg00
         rwe2yggURfhFp7ke+l3wKZ1HwQvWSUXLatR/k2P5bnp5xoAMOh4mW/7agZuli4LKFne3
         rnG3jdMJitNsnohhJZEh4ZJP6+caeo9Zya6UiNyC2peGotx+zDaMl0f04B5yI6QM83nP
         YPLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=YH/48JJsZzBRxwbzyo6G3V954ygxFPeo99hUpJi3Njk=;
        b=DGClQjMpqQBBU/PeF6OuWiTWN+fFq9HXCpaPwpR3Yij7UeRPyqCgx8s5OsfumR/3/n
         eNIwT6uXgiqZIVHrHHgmwIAd+o4e6LCXvdRDFYGpTakd5rr12eOE/UoMLp86HmS+yuOB
         ki8b1+JxG+Km7tswbT9j06pGPGhXU2WA4h9Rol4oeuy31ilxRQAIve92S+npZjbE+w0F
         Iocqfc3K8BfzP17UPTzGy/7DqwfmVTh8RCzfKspWoJJW0QHw1cvPn/RC5UaBioLsVcVV
         I6zPJqujL0X6idvHHmw9l5Rs+9JXUzEj0WLGP7235SMFxFchOTBzm1w38Bl1zAGZVC3o
         90xA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0Z5r3nfJ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YH/48JJsZzBRxwbzyo6G3V954ygxFPeo99hUpJi3Njk=;
        b=oaRs++24vCbrMmQZ+0LKYGi0HgkSajUuLoKVSTw2TNGJczSVRtM4cdt4Q6gdzodxXO
         qg7kVdVaPdIiy3YsDXrtUlT4IuJBmP2NDS23N4GgQjpOEw+SXK7NuiE8mlHRegMECvPo
         m7bna3nrapl3VpyWVceWGDhfPD6UO0cIAPODbdqQ7ooYjGH6Zxd1pWVD/S35RxRazrdh
         9SqIrjyKCYAy0d53JfqUqJIBRcddomRtw+t/Qrf/vdiWssAcTSLt4ZJVm1a7VsGiEHdK
         PicpBHUbMr6/OECoylOE4e+td/pSA9WC8gwL4CtQEOkfIeBprzM+E1C7ENO5isPAvQEH
         Rtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YH/48JJsZzBRxwbzyo6G3V954ygxFPeo99hUpJi3Njk=;
        b=Ulnjed4kkFUIVLhHGuQWITlR2U+4D9SxziTz9ZA41/ZmACDT1Abw2E2CJ3T7u8wYUb
         x+hnD9MOGI4lmiVCtcvgJ9DGtLKTuV1KYzB2MJuXt7uutG9TJjXS5TL+S4fr8ajG6Enm
         f6LwQLMLhCOlSDZwXGRnQsUezYl6zs48lxzcmZyMWUcUkwjPI/VWC2vFRYajFTJb12Bi
         o0X3ArwFrdd2CU0nblavrWwpeT+HaBWNfAuQAFwDd07WGyCCmQY/bsTiLTMJd1MoYnC4
         Gm0VG7de6Z2JYFz47ggpnLIEQkuiJ3A6c2l2etMGCozqlzhQprPyfrnuh3Ew4mNUuLmo
         nbGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWptcxN85tnMkzqmrVJw7j+9plwix4rjzc2qyDpcReXTuWV1DAJ
	G4Mn082uWLLPjOGdfqurcRs=
X-Google-Smtp-Source: APXvYqzhoHSi7wtgVFn6sDucly3ebZMAcEokcTusx0204Xn/jWwfEZb1vp1gAxJ5mqTLsqTts+sJ3Q==
X-Received: by 2002:a9d:65ca:: with SMTP id z10mr12733947oth.334.1560528778087;
        Fri, 14 Jun 2019 09:12:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:71d0:: with SMTP id z16ls1831407otj.2.gmail; Fri, 14 Jun
 2019 09:12:57 -0700 (PDT)
X-Received: by 2002:a9d:10c:: with SMTP id 12mr48862302otu.123.1560528777583;
        Fri, 14 Jun 2019 09:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560528777; cv=none;
        d=google.com; s=arc-20160816;
        b=y7YfikrA5KnVEnUENglMd9myDzp2Gwz5PUCWJJJPV3ID6ma24HiENNnc5ANZnh3U0y
         S/xepDq/rqmrT7VBBm/7gYUAnfR5p26jzstEheTpDwUiVLaYqdiyYviJb9ccNdQgI2DL
         1xunfcMf8//UPkp1liMA1frb9p9wJWYwbfu0c+Up/mmzvi0R6qZCsY2HTM0Vrn50P8yr
         YY3zlVx3K6/+ULfqwiZdwJRgIypLlAp62WrjSoCSxeATiKEmx4Z/gb82K3K7w6tS2Mr4
         aEw1ScZrNjgtPAjeIaT3gCtGk+YYaqOCOYtIbk5F68oqBmbiEzQpsgkH4DEimsTn2q/Z
         /HYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=SLp52XWlIGwl0dEkP79tFeWA40p6B/+3C6g3yoBUsy0=;
        b=NbNXCL5Uf6deVPOq82LgUiBiDimdulKarY+gp6fu6SjjpMLOqFkzZei4WtypYj+MCa
         3bqsAgXY8pgbQK79TF4GGExbN8jGfiMdToGgyrDcSZJ0uZk/d+jRVno4BDLzi5YYo4Zc
         EiX23BukKL1vK5kiGJzwX3BCYahihj/qvmAFIqdZfNT8iGRisgrUB2C7/A92hdjADCe7
         UWQKmlFK9XjZ1r55TPAiZYBIedq9MfypuU2NP9Buiy+LtrKzHk5BGy26ijsoaJM9idBP
         l7MnKtqHnN24rUj8+VDdoYLcL4X694bKI8wplItaBZgVUk622DOpZMOBXSWRZEb4oV6b
         CVnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0Z5r3nfJ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id y19si235760otk.1.2019.06.14.09.12.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 09:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Fri, 14 Jun 2019 09:12:57 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/26561f-6d5d8b@github.com>
Subject: [siemens/jailhouse] dfe91a: inmates: x86: Ensure 32-bit targets are
 built with...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=0Z5r3nfJ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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
  Commit: dfe91a43796ac4c67b52f6f735e475b445b2a441
      https://github.com/siemens/jailhouse/commit/dfe91a43796ac4c67b52f6f735e475b445b2a441
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile.lib

  Log Message:
  -----------
  inmates: x86: Ensure 32-bit targets are built with SSE support

Not all compilers may have this enabled by default when building 32-bit
applications. Ubuntu does not, e.g.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6d5d8ba6933b965d4138078b05bcf8fd395a10fe
      https://github.com/siemens/jailhouse/commit/6d5d8ba6933b965d4138078b05bcf8fd395a10fe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/tests/x86/Makefile

  Log Message:
  -----------
  inmates: Add missing FORCE dependencies

These rules require unconditional evaluation to ensure rebuilds when
only variables change.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/26561fa529d1...6d5d8ba6933b

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/26561f-6d5d8b%40github.com.
For more options, visit https://groups.google.com/d/optout.
