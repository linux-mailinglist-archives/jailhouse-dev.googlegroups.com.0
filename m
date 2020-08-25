Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5V3ST5AKGQEZREXR5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2A251AB4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:19:35 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id e4sf7912230pgv.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:19:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598365174; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y2jxY/Hc6exly4hWPNsnyX8xIGgG6cMFRNi5p1RGm3Dy9iTPOFW5zQUy8NtWs42qWw
         Lg++5X03OR9kyDg4RR4wexI++osRc3H3NQxaRKoPjliQ3drXxUt/O3rhd4oHhDoyU/vN
         yuYlJ02YRfma1IRnfU7/GUgynLnPTusVfqKqbE3ET8Np/BlWq5nMFPIvBhp/EvfETAp7
         LwR4cwLufvZ5wHwa0ZduPoB0hLGl2J6L8iXT/avTfX0vgonfWk0a9TS+q6fLzqALbbiM
         ZlnvpgPVt38JONa9iNeBgPLnwVfcf3VCnzvPp4Owaq+4fEwaX4aigRyirYUItKUCRdBo
         sr+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=PWoVZdaEf4I+7cwPsoePIX2q4LkgHr36xE2JMtoXnTc=;
        b=FdcLScxX7Wy7KEQsBDfjaXLiMyl9IfoBGx0VIDaKDvZ+DFhj7gHs91DhQsSolUP9OG
         0kzFvvIjgwTTBov8WXg8XPsSWmcjsVpmetUzaYFISek423xss3SLWnEIyzf7UwiJwGig
         NAobNrnEVE4LGbqNQcGpiWNyjGSvA73NKDznn2WpA4tOMqpUcIUVXKnw/Pp+YzwFtEXZ
         D6FDS2vf/FfAe/qMLxWzVOcGhmLnqtmpxrHxfAccjG5nUnGUxgECY3lHtXmxGiKl4AZ+
         4GcZ3iQ6ruowaT59XFX/va6fUmn5QaVY0G8+Mez4CcGD8D7iBIED3KgmhgUOvugA3B7O
         3Tog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ic84Plvi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PWoVZdaEf4I+7cwPsoePIX2q4LkgHr36xE2JMtoXnTc=;
        b=FPemoHYfWAeGT/RORbnlOWvdEHcQMm8gl3oe0i9cgPK1dHULr0trEP5cL+z6WKvluG
         KLJeWwfwqX/UhaKL73B+5EC61VRaNmJ4Y8dY7AIiiM0HyukcAfK0aKR9XufOqIPwkTsl
         8UNJDpCD2KjrzwENOf4r4J0ZdWHEJ6jJGhZKFYw4ihxRV1+GTOztOkbVJSNTydez/6ng
         Br+ms44eH3JtMi7HY7zjxchiKeF+RDhI+1BlDlKRr5WggAvI9sSfPcguDMUVS1h4zBkX
         SCkqHHg+1mPh2kGqxoFb0aZZ2H544mm30UmjWey8CCn7NnMSq6w1xJylfddS//n1bUR3
         XIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PWoVZdaEf4I+7cwPsoePIX2q4LkgHr36xE2JMtoXnTc=;
        b=I3RLmCi5FcAF3YeHJQtKFR6bvQNIhvQxCJ6gku4fbPQHbLnmTLr5627DhSBFfvZvOy
         YuhpEXcVF2GDeqAwtgP3pcDhqi0wQs7PDmwzUUW5rd0N8sSmpDjr7TQtFO3FFCwyCtcg
         AUOIl2HExKeqlJWSnzyrCq8eMR0c4a+tYEkaK1be59HqCTULhwb3k10uDD6aqrb0y9Ln
         pZu26ISwvBvo1rwJ+H81h8ZQeda1MBes80KVCt+EfqiwXTNQTAF1KbsvpDl2rQRuTGqZ
         0sS59zRxNU++xaOmD8K9+eVMRGj4LQXFJWNVCaM98/pCpmUhuPe3iz3y76F5Shw8WJbf
         Qg8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533S9cWvWDjgBQaieqtRBH58pIg8gAy/85sUttDfjcYdyoyvnhMY
	XxZ99SumszOEsf77b0QEQ3M=
X-Google-Smtp-Source: ABdhPJzeTUSb+prTodEr4K+N8Klb7HsBloxCS4BVHn7F9PLNVIQzT6vXGmQZTsPWNTyIjpTvaarolQ==
X-Received: by 2002:a17:90b:884:: with SMTP id bj4mr1814536pjb.90.1598365174486;
        Tue, 25 Aug 2020 07:19:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:c244:: with SMTP id l4ls2439318pgg.9.gmail; Tue, 25 Aug
 2020 07:19:33 -0700 (PDT)
X-Received: by 2002:aa7:8f22:: with SMTP id y2mr8308765pfr.146.1598365173657;
        Tue, 25 Aug 2020 07:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598365173; cv=none;
        d=google.com; s=arc-20160816;
        b=jPu+0Q6eOBItYZTRC2Da2rJqoBbRsPvzoMj3XGbOSqTsAYyGUsZP5RKFY+n3/IplYg
         lEhJwF/eUe49Tojjrtfh3hGSQghUVkcAzYZihxfIQiIjZZ24D390xwnMKMtIo4ersHI7
         OI0aSArDyPlb9z/oeEWCSR2K9Oyhi5h4/pj2ETyHZtAoHqbBrBO99etKTqxQ1Qf96xj0
         FoTttRXGys3qySDqOw3TD1eFKZ4VqP0PWIygKruAXg7lvHEhGUt49fzzKj058arCXYUr
         PLsjVr8nCDB+2tbKgFngL2h945VZ0aiaaugM89yrZffKWMdxPI5J5DoHn3wA57Ota/22
         79WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=BvF/9EvUA8OZxQars7SQ7JbQ74Oy6ZGl0FvaTeEg/GCwFgHX8P7VU8RNRzvKbdxqUS
         rqFJIC9qod9uS2sdW5YyK6rlQc8H2p8ocwHAG7a5IWxyNrYvpEawIObBYyDqsZoSjkP4
         fL3h5pY3DdGPXSuss2bd8588u/BQwb1BnxU+rOA5sEkIpYoM4SCDqsLaf9bWxGfla+eG
         dsX+wWVxPUuKmgeTZuf4CrQfOYBK701Q6g3LSJKo5R7gOUvs4MJV5fS+KIs0x1pS9F7D
         HOtw7JrZFYHKfATmOXfc/lJYGnvOVT5IakhufCvfcL+Ya6GYTOxvy+lgROvlwtz/ZbVu
         DJPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ic84Plvi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-26.smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id na12si110914pjb.3.2020.08.25.07.19.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 07:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github-lowworker-9bcb4a1.ac4-iad.github.net (github-lowworker-9bcb4a1.ac4-iad.github.net [10.52.25.84])
	by smtp.github.com (Postfix) with ESMTP id DB3385E0FB6
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 07:19:32 -0700 (PDT)
Date: Tue, 25 Aug 2020 07:19:32 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/2f0c87-6d7eed@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Ic84Plvi;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/2f0c87-6d7eed%40github.com.
