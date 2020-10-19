Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB6VRWX6AKGQE3W6NJBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63f.google.com (mail-pl1-x63f.google.com [IPv6:2607:f8b0:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 73373292475
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Oct 2020 11:14:36 +0200 (CEST)
Received: by mail-pl1-x63f.google.com with SMTP id w16sf4525051ply.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Oct 2020 02:14:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603098875; cv=pass;
        d=google.com; s=arc-20160816;
        b=akDT+oOJT417U4SZTq3wMVPI4izhUbrlwuMjkn2DQXlhmrDyBbiiYJYsNigTMf9Cvy
         kPz+t3EHBeLqIX8AaRDaT8L0llG/jG2DTK2qV1+wT6wgZ/bRxeqBqsQF0O7nfm1zCenD
         o6Mysu88jAEWYLDCtlSrNjE1l83XVutUMEwWS97SC51wvuXWMFfYFN84HPW61TKNKP7a
         R6M/8h7xu4+IHkAiR3oykwb006O57So0UFn5kGyC9jplYm4uQeStg3TF7AuqN2OY99fr
         7Nk6isZ9I/dX6iul7oGlF3jN2L24EQAm7T3RSBm2E4YD1MpUOPMIuqqy7Vg1smE26rXJ
         xesg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=Bi5gLMR8w9rZo6nOd83yygVD+HT3wvLFPuMua0OimIw=;
        b=LkX6n8no0pG6gSCYIp2JCB/xW/+P69P06EU2y85rU3q5Qlizkz80Pk7U32MW0ft4Qy
         NhOZm1d4lRVlLV3vWxr9YVIjlDTRNFJRSqtEd4wHXXqNyZ7Xtb21BK9/lnTkFBDl1kCs
         gCEMmyRAvCSvw9vNgAPT3VmNMT9SrIjUTT33bxjMMOZyafm9pZBTq/F8HigYCz9MzIwD
         wH4VUi1YsYhv63gbr2HNgTH2z+VjuhR2E1QSoAYF1fmpLHRPioxiNcKb9RkEWs3mgYjA
         4lsLWXJLGuAY9wpDXKjEeKVkVj+GzJ/6hZfJfRKpp8AT701J2dSVx0xi6nlqW7O25Q5U
         ZF8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0uCh1+0o;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Bi5gLMR8w9rZo6nOd83yygVD+HT3wvLFPuMua0OimIw=;
        b=rwOehP93ajjAZO+c0UesnNSqUQxLQoXJBMhXtkgOtykKwFfJy3t3HytN9O8mCANgK9
         PT+ezsDd96WuxQt4SmDOpvt8DPKevgiqdKBgymgE4Db/3DCEUvpdaBnRyolF6PrOFigB
         3wj+6dzmMc3kj8ncoYURlCAIzJFBBxcdmbk2+9VtFIsr/UUwIdOegDu+8AmCWhU9n/D5
         ZDZC2C4+CXM7/NLQLu4Id3nWFDRd5Sx/70+ozJT4XX0YlWX7v7Si6uiBJQ3wKPL0DyIG
         kh/pfwhK9jMGVilN5Zuh3kQj8ZJSNxbEnx5Hvl7huOxe0EKR0ylJxzVv2EStDBJbqPLr
         ji9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bi5gLMR8w9rZo6nOd83yygVD+HT3wvLFPuMua0OimIw=;
        b=fauytSOD1vwOVLYdr5lemVCgfbzLXUF3tFkS7a2ciVm2uo4vvtAGRnN564VDau7a11
         Y5Ia9znKq3CoMqGgf4oRoDyVQY2fpZKdJNcDdmuJ6XfE6sroR/qOaYb+mKJSK+n4Qw/4
         Wp6CElZPnHi3m0jHQyqjSpOyUCREkqsOdbVvX4hkh+bzjq5Fy3x9kMc77I8rz+KLS7ZJ
         /CxMw0SreKJ/gXMLZnzK1egvoQ8QXdBTfRE8W1FTCDHnepA7ljxEuI1Pom0I47yOX8sZ
         X08llgsCaxzeqNNrzRjKUNqmjeGyGpTV8yyf3dCwp7WdOUaJYFXmmL9aYGpXo9CgXPEl
         jSpw==
X-Gm-Message-State: AOAM533QPTeypCwkSaDQtDF/PGVWtkzve96viBcJt5sfzGsKKvC4pqL4
	ww0mfZ4Z8rJfvoA3xBMYqjw=
X-Google-Smtp-Source: ABdhPJzlkeElvvi3sVH9fkpfkgOQ8DXy2f53JyR/A8ziX6W6TbucfbLSQahzlo+X4e7v/H1hVt3rNg==
X-Received: by 2002:a17:90b:710:: with SMTP id s16mr17347303pjz.138.1603098875147;
        Mon, 19 Oct 2020 02:14:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:4547:: with SMTP id x7ls3233061pgr.2.gmail; Mon, 19 Oct
 2020 02:14:34 -0700 (PDT)
X-Received: by 2002:a63:5566:: with SMTP id f38mr14084111pgm.9.1603098874440;
        Mon, 19 Oct 2020 02:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603098874; cv=none;
        d=google.com; s=arc-20160816;
        b=hIUt2z/a/kDU+oCx+BO81gmJa9r2hQRCPeSS6Hf/2ruY83TUmsLkk7LRtXWxI/iafk
         1LDlI7/ip8t23OPewmQAX+VydZOdv9drbGQd6F3CwWEQR5jdEJVPp4FO6Iw1si9KNjd4
         befbrO0ii1N5GlDPGRxj4tmKkNLyxb4iWXpCxLkjIJMuwxiM4cE+xh6LzGQ2VxMMnjV3
         pLbzYUJdlvYoNaYjeWyXjOxACGiyNBshz9irboF9iGI7mhjIfN9U8XHhoZ62gXwwZPzI
         eRhY75htLkfDT2282j49pOgAunvvjueGBkv+b1mXL7xzEk7ui/x5b4g8CXgYSEENlhKK
         EWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Mz6j5x5oYac2kCLPe3XmkxVW8wExkDngaZS4uYViqb0=;
        b=kW08nikN+wjDei9g2USORbHtMboEgrK3el72Bnl6MGL4mCjowDDoK9YPxfxJjZUgEh
         Bdwg+BWa5hEvVWfcBbZuQ9GV4QdDy1p2CK+L2me22mmmg2Xu0z0LdvWx1Otdpk+rWGog
         CDEaVfRGCGREjuouf6YxMht0dtM2Xeok8euPV4yPviS8BIv8/nUJbhfoN6UML0+bj91n
         daiyHaeNCKHITuw23lsOCdzrdZB5n0BvzKN6PedCqDkyNEbqLsv1j56IXTIH4NV9mPeI
         9hJUYi+wdvqoOyOG1Yru3LZ6KINDDN4yjcSxiQPSxp8XXSewBY+D6Dw9TmyBbYoDisTz
         kkbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0uCh1+0o;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id 191si589998pfu.3.2020.10.19.02.14.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 02:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Received: from github.com (hubbernetes-node-a87f560.ash1-iad.github.net [10.56.110.66])
	by smtp.github.com (Postfix) with ESMTPA id A3E7A902635
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Oct 2020 02:14:33 -0700 (PDT)
Date: Mon, 19 Oct 2020 02:14:33 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/1f6e13-e636dc@github.com>
Subject: [siemens/jailhouse] e636dc: pci: Tune error output format
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=0uCh1+0o;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.210 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: e636dc0a5d099ce95d2c26e485e69a30874ef0d1
      https://github.com/siemens/jailhouse/commit/e636dc0a5d099ce95d2c26e485e69a30874ef0d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-19 (Mon, 19 Oct 2020)

  Changed paths:
    M hypervisor/arch/x86/pci.c
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Tune error output format

There has been the request to prefix hex output with "0x". Also, one ":"
was missing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/1f6e13-e636dc%40github.com.
