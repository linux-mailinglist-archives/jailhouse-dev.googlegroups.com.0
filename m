Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB27Q6PUAKGQEHNZQPEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8655EBED
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 20:48:13 +0200 (CEST)
Received: by mail-io1-xd3f.google.com with SMTP id v11sf3587414iop.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 11:48:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562179692; cv=pass;
        d=google.com; s=arc-20160816;
        b=1JcNpaJ7W1PKR8X9nek//ks/z0Ay0vMltVAZXpNK95b1ivkmGcSu2uAcL4oNEOKsG4
         l+9j4c/1iKeZm/GTOXIqe2Mgn87k9P2ffcF6CFJfpz9HrrXXZbRYDb055O0KEWqQ0Et+
         QRl3rVTe/G3RQKligCqJ4TEb1c7qmY9S8/rqWu5lR4oMHOrc9uRaR8mn8zfbQp+UQzxd
         /fLYo6pXAJ+D6fVEE1Hkld4/a95POWMgjzh3G1ZWMGyG0N1C5vIlp/FgcWVddYirjwkd
         UGFn/n8/mWb9z84DI7sRt3pCc4rq9McEyDScAL5lw1TujFoZuzAPiuzLekAgMoGa+mtZ
         ZLDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=+DpgdoqHeyIycWgcBjvvAC1d2qD2R/udAD73u/fDkAU=;
        b=QKnBFoxGJXD868Zmsyk6rmnpGFmDb6Irt/0TN318XGxurIEjvLr+hoOx1uhrz/zeOk
         qQcWQhg99QEZ9Rp2rX9Y4FLehU2fRFNdNft13pmP1aUwuWEa90PZU6eTp5SCisitXHNo
         d4lcjSDFDKoalDuactBb4hAUUn5s2m7UxB6RQTM3mHcxzWydM0v4iqT+39okrvv8GaS2
         IqXp6E98hu8AOpg5sB3fTok7KKQyOGMThsl6kuUj7ZHAXWwOjuMuSTCdQw0XBzvbsnDd
         P3IMP5ybTm5Ab5XXGNKTokCGIXQVLjkX79TBNXPj8fbDsDvSGN7+IU4EhrBYX2a4UdK1
         3IkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=atuORjcM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+DpgdoqHeyIycWgcBjvvAC1d2qD2R/udAD73u/fDkAU=;
        b=QmThr6fjYkztHSunLZ9TZM/gHAKj/3eqx5n5b2JDE3viCFexniduEnBdP3eXh0oPvo
         OLa/3L2BniP15+XcbcDPysmb3qGspvwkv6kA/jxlkAn2aeoXBFC6Slv2kXht6Dl3xMkv
         R0E3wW2SstKM9UjKFmxX98/bUt/fk/jer/i9IwuHt8cIvuqzAseqJqGI5MDlEssG6QuI
         Y//iWgYh9ZO9MZGja4RQ+ywYXLET+4U4wi17RQcWQM2Im3HMfskcOafEQ984kbfNnmNW
         wjj7m8AYfyRLMMYo1U2f4muVIIi93QBlwynXHHMM7zVA8EmZhT4p74zMXhVH+ajfWeQv
         c2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+DpgdoqHeyIycWgcBjvvAC1d2qD2R/udAD73u/fDkAU=;
        b=j6i9Cq+l/czO80zEnHYqM239fc9j1QzOjbIWOgp8LgKy+8fQKq/imViKzDRuGNh1vs
         Y7PFNzoY29wJAb91QPcy1IrhFRx6NndSUt3DgHY62WN0D7tliHDTSWr6QlVibZ9ZRKBT
         tOmJpobRJMHKvKeMxntBfQC7cwBm+d+Txow14JfrWkfPpzQd+XzlwDjdZIGB7xDwq3j2
         y48DOZksqawgJa7SyUFId86wh2DoqKUSRDlgpHszNj5j0IT+KAGtj8eO7pNAgf6VpUhn
         d+J7wvjRvZXn+e6TmX4uxHqTlYmIeHgnSa1SDzd4nzaks4p+Rk6Tim/HUFPmQzE/2LEW
         Kqlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWhncICJxXvSsfZVZBKthcou3OcHhQBJ66Qe5J9/6anhrwj0wFI
	byASzPuc7hWO5tv9S5xen1I=
X-Google-Smtp-Source: APXvYqwusbZsaVambx6Q6UZqFXtYdvDLZNZmWbhoKItF0X821SjqT1822+WDcKby40lP+2/vhdHbDw==
X-Received: by 2002:a6b:ce19:: with SMTP id p25mr11003182iob.201.1562179692071;
        Wed, 03 Jul 2019 11:48:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:e00b:: with SMTP id z11ls814699iog.9.gmail; Wed, 03 Jul
 2019 11:48:11 -0700 (PDT)
X-Received: by 2002:a5e:8e42:: with SMTP id r2mr14826152ioo.305.1562179691628;
        Wed, 03 Jul 2019 11:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562179691; cv=none;
        d=google.com; s=arc-20160816;
        b=HnwAUbmYd+cECPEuGGNFUbpNOOtRhLPczdgKw/IX5MP0fWpCcBz0jAYKUCxIl8VIFm
         ajKR8IBrGdNeMKCiqvZ8m8LzU283SqYz8oxonct+1X2TbkaSQp+CW7OeAoAkUT5O2snY
         k4rYQ5hAyT3TiNDB/OA8RAv9moa2NSeODyejhRQzc0Xw1jpCQ7NsVHOOE13aOjmJHx+e
         SNxiI/2nJlK70BglrrDjoFH7kyb/U1LK5XwxThGUFn15RxCX+B2SC+eruG7GO6VC4fep
         Io9w0VYYgc9Dfm2W2WLCtlJX8ZnvS3+3fiHr4G2R6DdsOn/QVaNhG7YWfSfJb2fgYw1w
         NmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=smjZncF15Cr4hefxnAduwgY6loOyYNjeQM2DiD1CBeHk2s+o7e86tjQy6q+p0SwM3K
         F0hI5DBDMsRBnu99OncXjhAYfMh3sNVI3WTPHaiTBbEeHnLyv1xP+k8Y9KQmRi3oJQn3
         tyZ5DWOEO95cuBaHlTjwBIOxJ8nnpY3OHZIW18yKxSmk7io5cPMzmEfO14ch1K191RGt
         cuTlkyLIFm5oNAia4DMWSf5sBL3W7S5vSRPqLK6ghMwN5AbUWckRuj9cEgLnNizHMpc1
         bQrDp7srAS9AI3bbdUnqe7U8EG8/rfchZ1Mts4jTNXlfGycz5S+epo4uMx0mrUGpC9nB
         zXdQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=atuORjcM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id n7si106259iog.1.2019.07.03.11.48.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 11:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Wed, 03 Jul 2019 11:48:11 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/0ecdd0-a17c46@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=atuORjcM;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/0ecdd0-a17c46%40github.com.
For more options, visit https://groups.google.com/d/optout.
