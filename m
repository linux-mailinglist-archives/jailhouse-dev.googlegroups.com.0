Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBLPI2CDAMGQEB2PIK6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A023B289C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Jun 2021 09:28:47 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id a5-20020ac84d850000b029024998e61d00sf5327290qtw.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Jun 2021 00:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cAXX2fQCaETc2/vFtClD7QX24f8L11SS05YpQ5PZrfk=;
        b=gPrYdID2USgdzPAdI3WaunEBd2sWboV1DH+6q+eH9oU8dlswM9NPsyULQS8EM2+MhO
         N6yskBLWQje3Y8Aj74oDhRaArFqP2cuk7+NhGQEyWuD6L7XytbwvW7eoIMxxHdnATULk
         eekMTD82PEgGj0IfY2bE6CIwFhrr7Pa0zJ3zjrI+hT3w57zn2tvUYE20p3ZyIedSR11l
         6I0Y5xSQ7+qHErSNH+y4duZ3J2OZ7p+rq1c2/Ae4puXgeBgfGQn5lzpthQK2BKejoQVS
         RhBc5UOwmS6G/QGgOTNS642RjvHBhoMAmm33DiNPN1s7ZD8EA4YXrsHTdmdBbKkvhOle
         oj7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cAXX2fQCaETc2/vFtClD7QX24f8L11SS05YpQ5PZrfk=;
        b=pxmq+g6s0EAYL6bbGXuZfsHzVMybChpgqRB/XRMbe1JaZUzxOQCu3joHh3FjGSYUks
         aU/y4EzgLghXqd7WtO9l4N1qs+WbtQK9HjRxuKSGpKljgRsUn1nsU9M+rg0WVCduBoVJ
         rgsVSRINYHRPoOTutC35n25yQYEkyGLTZah8VEqSqWCF72iZH7BgJzCSuLt7Q9ExSLVj
         t4NLcsx8uhQdcPRt+KBfGdgipZe4tRftii7bmsFiJrJArPoMCYWgEPpUACQ3Xo53vYGM
         R+0QQ4CMb7/O4NK0TtRZToBrLGsRzwpv/JzOuwKunjbsAbXUAZufh220DJZ5iEUP68Fp
         fUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cAXX2fQCaETc2/vFtClD7QX24f8L11SS05YpQ5PZrfk=;
        b=gQcMTZUeCv31qETRC5MYbUXYt+MPRQZ5wO6g1F/RQb/vKNMovUHUaYvrJqmYfIRqOt
         dcFdZDcgdAGYiMSRjnffjcPjMlF1vJ++scZKoEJbTrp/T9ZXlqLubsighNZQdXpuTVSH
         6IUjvpHmS9sMe0kg48+Oz8hhawPzrMXeBHgj7pM0GxUelVBF0XYQ0SaAEqvGAuPr4u/8
         n62rPeJ//uQMN1One+hy8cufasB69B3/CpIi9tD6d7zlApgZsaUt2p3wRho2YWhgI8/b
         hDSyC6iEyDjYE9JjJTa1v5eGRkhj66y25Bckt9STfYRCo4fWEoDXiYNF+hq56KarbHfw
         rA1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532e8PBQUXBKJdMqCmo3YV6bbcYhvgH+/JvDlBxEQ5vvLXdZu+iV
	ssHWfZy6tnzMuXe3w/YDk3g=
X-Google-Smtp-Source: ABdhPJwXXkKxmElFMQHWLqP89/5a5V2N/+x2OhvOXQl5PDVufuj/2rrm5uMABJ0O/jzl2NX7Y5jidQ==
X-Received: by 2002:ac8:e08:: with SMTP id a8mr3621678qti.346.1624519726081;
        Thu, 24 Jun 2021 00:28:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4367:: with SMTP id u7ls1712187qvt.10.gmail; Thu, 24 Jun
 2021 00:28:45 -0700 (PDT)
X-Received: by 2002:ad4:56e5:: with SMTP id cr5mr3715243qvb.7.1624519725446;
        Thu, 24 Jun 2021 00:28:45 -0700 (PDT)
Date: Thu, 24 Jun 2021 00:28:44 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <274afb08-1ed4-440e-b41b-6ca12a2ebe62n@googlegroups.com>
Subject: Recommend some books to help understanding the implementation of
 jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_326_503434194.1624519724932"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_326_503434194.1624519724932
Content-Type: multipart/alternative; 
	boundary="----=_Part_327_626132764.1624519724932"

------=_Part_327_626132764.1624519724932
Content-Type: text/plain; charset="UTF-8"

hello community!
Are there some books or articles can help  understanding the implementation 
of jailhouse ?
Easy to read for beginers.

Thanks very much.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/274afb08-1ed4-440e-b41b-6ca12a2ebe62n%40googlegroups.com.

------=_Part_327_626132764.1624519724932
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello community!<div>Are there some books or articles can help&nbsp; unders=
tanding the implementation of jailhouse ?</div><div>Easy to read for begine=
rs.</div><div><br></div><div>Thanks very much.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/274afb08-1ed4-440e-b41b-6ca12a2ebe62n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/274afb08-1ed4-440e-b41b-6ca12a2ebe62n%40googlegroups.co=
m</a>.<br />

------=_Part_327_626132764.1624519724932--

------=_Part_326_503434194.1624519724932--
