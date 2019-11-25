Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBEUP6DXAKGQEMEJ2FEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc39.google.com (mail-yw1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id D986F10923B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 17:55:47 +0100 (CET)
Received: by mail-yw1-xc39.google.com with SMTP id k81sf10318045ywc.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 08:55:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574700946; cv=pass;
        d=google.com; s=arc-20160816;
        b=YBPZTWXCs0zsC3RkQhsvhkEHhyWzX/bKkVzERk6Lfu4JmktRMBSJnqnOlqDcBzCtPX
         d7gA2zm9PTxPjZWKBS10TxJwKlyM5DB7anNoGH/18TtADPP/smKm1ImwlyBVNdRTWDLW
         cl3cOvnim94IlQzlpz7A0lDNqdkmxdrtlYRpjMB3BzQY2ZG2vFGWAWASMhs5rod3nses
         Uyro3xwj8DgUAClgmEgDffGsZ4RmPdubuGJESYu7ldrtBBZN4fM/ok0OteGslZ4pSKnO
         PddtkKp/BGCcVlP7M1rOVi72Ohw4H7iLxvoWoDlIJkBRXnJvLbKs8gge8ngGXqivxhL8
         DkmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=XdNvDeUJlC6l3DU5m2FUZlRLpcz1iKrUBlcSB61rTqs=;
        b=jfXzdCDmf7zTprw1WDmJbhxru84B/h+1OfDgxMsS96/rtg1EGzkOHxWbOkz8TkikGG
         2266XchUtgQF8rBWLzq+QcI6ZIhbldcLpYEQ92unTq6cXeP621TlioXlOQY7TAAfewtZ
         2YZokLmRWNEXIDpIAclHOh9jxowpS2BqHGsnbRN8frAblA3qB8Kf/QlveyHWb2LuRTWg
         XhO43RlSdz/dh1qYvMRu1UPcSnppcikPtq81wIoP761BpWTt1E9U6jMUc6pvUJX/Qu8V
         rcNu58MAJPaPy4xS52dWm2e6Fo8YwLfuuxF+FarDtQIhIL5BzhZKLLPmKgFSMf5YsmVl
         ipFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=MDbt4ont;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XdNvDeUJlC6l3DU5m2FUZlRLpcz1iKrUBlcSB61rTqs=;
        b=mb+fjBlWLRImblzgIAU6X78qZGvd1Whb7yaasZzmFhvvy/q/iloxh9f5aJOh0YLkQb
         ozub6QZ7ejpAk51I0PHiq9SdCg4ahnrEs8iR/UQ1Y9Vm7UndrOn1mqQuAzfsDPCR5iKp
         ua89bRNPg0btOxyogA0oxaEN/5cDj9M+34U1aSbcU2ftksqu1yFckN9swXRVLg/M0eCK
         tcbt2kgAiRtGk8TaxkdqKAYtqYY4q2JNRXFn493FqmAVwYsRxZvRJ5gZ9jO4pWMHpfjq
         g303Pd2b4cOKXmRwmjR2uQ9AORui+Ff+yCrnzv2mPLnNJC4W4SSG6poAu2JV94WtT4S1
         Qu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XdNvDeUJlC6l3DU5m2FUZlRLpcz1iKrUBlcSB61rTqs=;
        b=rt856KDq5ox4nVH17HS7W2zE2w/LSJEdw4wJR3HXfqiX7OMDxGtJcWAzTobzqywpPF
         cCK8FhOL2ufTf1O+JEUv6Tfe6C5zmRLtCBVUSf2bvHI/BNnhnWG7rt1wJzVOmzxH5m9m
         fO5q0V/NfNXCh3LiCZ+k0lRb91Kjl0xhCfbMjN5um7jsltA4HVSU1yzcVOWFE/grlsuZ
         80u9GWYL98jRVx0wOyQy2Psl6wdBmq632vbXw5L4ShP4ODnHEvlHyziUaKpCtykU4a82
         IZslBNI+Ao0O8EjUIMieReiZZek86wCDtDQz+wdcZnII9FcWP0s6EpD4wyd8sTkhT/P1
         dVCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUh3sln1Os3Ea8D/2a4XjCz6SxQj6kzTUpp2ktkVahf9zKaur9V
	zGZe+XUREfX2z8SPGtballE=
X-Google-Smtp-Source: APXvYqyPqBjL6id/extUStpry0G8cuMBa6jArBaLCizg80bSItdvzH/Iq0QVjVFtrxtfpt7j3M5AcQ==
X-Received: by 2002:a25:3897:: with SMTP id f145mr24714161yba.373.1574700946457;
        Mon, 25 Nov 2019 08:55:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:3dc7:: with SMTP id k190ls2559793ywa.8.gmail; Mon, 25
 Nov 2019 08:55:45 -0800 (PST)
X-Received: by 2002:a81:b54a:: with SMTP id c10mr2524610ywk.139.1574700945568;
        Mon, 25 Nov 2019 08:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574700945; cv=none;
        d=google.com; s=arc-20160816;
        b=biUVOvP+i1K+jMXLWSzfLOjMKCsk8JyQrCpGLreetmomk5v7QUCxwHP06fERqJetZv
         nu5demvTHzuz3VW657aYUYRP2VuYNe+gxYXq8cGJY+k8pvhkmDYdWhKGBTDd2qHsOmg8
         y7r7d2FqbkKKgRSGAuPX6DplwNPlPsrDtZWSk+1rpT+0Tt4nj2WfIHLimtr37tCRhQep
         ShvDSLDO/z+4bQdpYDSkt9+Rdb0rIjHb9U/etJxWOgfaOiLfiECjbdoOtCPdJhjN+yFN
         Cuge+h452eXlMaD7mQdfSJrq1lawBqdmun9FieaKAFAdbilCp4K9I0CxVxl+lzPXz/K3
         1jeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=70tTUomPFtG74awX4aE3/z4Z7JgVNjOe3v370L8oyhw=;
        b=VMlMXpltFyjnIiUgSgi3Iru6FBaw9g3/8z+gKhqG4n3KiRL/kxIk1WqVCtju72BKN4
         VhEpSTM2pPHGjLYVVmN8S7o4kmect9ZqWQo4iIoirzIE/v5/P78K1nSWH2+FeTWVJLTo
         5kZPty06Tc93/6spQiK50BuJWkpoOb5dUOzja//v9OP9WlM9SzuO5+d62G7/PlRLRE5G
         qG29GLKcG1rQmrWHwKF2PCvGi1+lN1b5uIHjptf/icuF70YqEbai2uh8CPkx93qmAmoY
         AHTLzmmetcV6w3HGafcuJXE0TiHTi77vqpQiWxl2vjXt9fIoh8FWN8+55moD/szmIDhm
         kBlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=MDbt4ont;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id u3si335028ywf.4.2019.11.25.08.55.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 08:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Date: Mon, 25 Nov 2019 08:55:45 -0800
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2338c0-cd140c@github.com>
Subject: [siemens/jailhouse] cd140c: tools: jailhouse-config-create: fix
 python warnings
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=MDbt4ont;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.194 as
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
  Commit: cd140c5a6d858a5b23bcb3dffd55876817aa79d0
      https://github.com/siemens/jailhouse/commit/cd140c5a6d858a5b23bcb3dffd55876817aa79d0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-11-25 (Mon, 25 Nov 2019)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  tools: jailhouse-config-create: fix python warnings

Python 3.8 complains:

  GEN     /home/ralf/jailhouse/tools/jailhouse-config-collect
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is" with a literal. Did you mean "=="?
  if ((options.root is '/') and (os.geteuid() is not 0)):
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if ((options.root is '/') and (os.geteuid() is not 0)):

Fix it. And remove some parentheses.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2338c0-cd140c%40github.com.
