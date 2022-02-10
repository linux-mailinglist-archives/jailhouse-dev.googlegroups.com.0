Return-Path: <jailhouse-dev+bncBDMZPPHJX4HBBK5DSWIAMGQEZ77ZROI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB24B14AC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Feb 2022 18:55:57 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id 27-20020ac25f1b000000b0043edb7bf7e7sf1599286lfq.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Feb 2022 09:55:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1644515756; cv=pass;
        d=google.com; s=arc-20160816;
        b=V5Rc+It9m9M+AuAykr2E5jqJnB4yDRzhZaMpUb6Gf/q2UsXzGC8ejonHykXT6teyZx
         x2nhdjPBgSke3fS2u68OyW8BS6oVqmTDIhLcUIE9qMS2N9XVyaiuCD9Y1jsGvBj65hHx
         apQ4LQuuK9Ci64/sFo9roNHBGIn6AW2KMdBdPXwEMVsVn1zwjCkmwPMnNiwku+JgUkcO
         n4H8zrly/HcoX5gAcrycmjcietAz+tW7VgH7JiASLz72p6sC9iAc+tvZ1EZsDmwjjB3E
         s1QZLC67XyyAOaEwJ3KWwzF1rgpI3Hybnx1X5rLDT+wleSOBSomRsTEqY4koj9Ge5NiD
         D9Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=ATOTPD+jljXowk9vRkbhWfoMNX4Mw1YxcLUo9KoXBXM=;
        b=Zsd8rtZ5Ne0mOsYaIr4C9EfWleECiasJrTFV51KEHzTUZsM62xDll+P8jFWlw0HaUj
         NKhS19kqu+MO5H47Fa6O7Refh9OfXUGpe93xVyJKRn/O1SCjBRR4tiY0yndVXbFvjKB/
         1TmIvCeQws77T5GR+JPRaqOXksCwMSg9YswzOPzYXv8E4ekc+HNfrsxZaE/JZp9e/9xh
         X8/6l1O3kP1IMTCjm3rPOFfJ6/Ign5hkSGgoSu2iTVNGHhl007XL1s9B+g7zPOQvloSY
         NHwSNrwon/7WNQ2CxSX/0BIsbUtMN5U1NhGeNeHYxpa66X0vojowxcIIzfyaszBP3IpC
         A4fg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jW9tt+6e;
       spf=pass (google.com: domain of timothymack332@gmail.com designates 2a00:1450:4864:20::42c as permitted sender) smtp.mailfrom=timothymack332@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ATOTPD+jljXowk9vRkbhWfoMNX4Mw1YxcLUo9KoXBXM=;
        b=U7J01SjGc2D7LS2B3yPikgvFONUZDvg+l8si5+HfdZlEoqN1cJ+n8Z9c1HwlpjierO
         2p8GlNJtS/M2Vaa68SbR2S9CUuhp3xtJOMUeGGvHD7FF57L7hUzGofgzdtAjxSsuiB0J
         OEoPClzIZ3YvnNl1VdzMy+vB0ZiknFiK7BMF+APn1C1bNAm4HKS7KFk9BjUPe6lcGUUm
         yG9NDRTbX3F4Ujx4AcvpJWbpxCwh+L/USh5sUZkwsnsBmtDUOa0Uyx4X51UTCH4h50hA
         /KVAeetHu4tJ/CeUH5KPW8M9GtRPHggzsoOLLiBQhIyZJs2Jc/FaAiG0FB7MIr4D9j1S
         F/ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ATOTPD+jljXowk9vRkbhWfoMNX4Mw1YxcLUo9KoXBXM=;
        b=SaNtLh1eoIpfsb2bq9pSq90oS/1+QzKFplMVontl7x1y88ylwPHWfIVCUFMeMs7OOq
         8qC13wutwjLuGzx5OySrzywpF4qoprHDJPTSokNGWiOIFsgggXLoJT0QuGz9Q/UhlXo4
         vFn3kCkBu053m7SQo+HVKeQJfgqL98OxhnpKtwFVEa8t7N9DG2SWR9urAC/b9gD/Sfd5
         kW4Ng2gs9KuhgJ3dEgn5xhrOYU4Bm4TU+Z1WasJe2tyA6aAce0CuUlfeQciy2NM/W7UB
         99GFdhxnhlQTrs5HIUNMWrkV9/YgUZQPeEQuouP4P8ee6m5hF/0c1LPH04Vxhp4QsdUs
         957A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ATOTPD+jljXowk9vRkbhWfoMNX4Mw1YxcLUo9KoXBXM=;
        b=uKzG7g2vwb8tevJNOXjlINSE99gmS0RM22hj0/RjO+mfG2iVfWk7WTvJ65yNL6Tkcr
         JTDju75jsJhQl1LSRsle3gAOSqcXjFT2Gy9NIsNxw2SvO1FLq8lg9ulQsPS/Hdz6G277
         tqZn047DGbe7bj0TpI9xFdq84TqXDFy5nxd9P/n+CiqAmFxMa+c6iVLAJYN4eBoe0/V9
         tbw76r6fV7Ep4P5AZib64csERo2AbVOihguEETSwzzEKx5OgpbNgzIg5cAm3/os03Kk2
         9JBGhWzeFEA+0px3pE17s/Zl/kjjUhuuikWjD7/XvziyhkDEeFGCwGpgR3WxGyPAvVB3
         BmyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/I/jmr+QWA7uFjX+6ip1RL1hv+NeIMf8H5uRTuDcR4LZw5t54
	5h4mtXFKgbL9+tpZS3Zi9qI=
X-Google-Smtp-Source: ABdhPJyG1uJ1N0nJ4x4bMtUpoYIIVB+q1tz3YRvul9XiWxVu+AQDShHT0gURxTq/L10MGlFYT9OUuQ==
X-Received: by 2002:a05:6512:159e:: with SMTP id bp30mr6034567lfb.324.1644515756792;
        Thu, 10 Feb 2022 09:55:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4e11:: with SMTP id e17ls3780077lfr.1.gmail; Thu, 10 Feb
 2022 09:55:55 -0800 (PST)
X-Received: by 2002:a05:6512:3091:: with SMTP id z17mr5978125lfd.216.1644515754937;
        Thu, 10 Feb 2022 09:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644515754; cv=none;
        d=google.com; s=arc-20160816;
        b=xmuej5HvQxJRBgacJZHo0Jl9AQ/d1u1pW8AcX/VWruLtWOnZnp3qMxa/Hd9/LtJ+jT
         TPDBDRt1EM602duvRGnZ66A3IWKV9faexP8BPPUtIeUUUHtEuziGfF55BnGPSUurT4dc
         AD3WKkI8wI6QNAa9e2SBLV07zx7CTTYWzqbAHd75V3gKqsmQ85WmHsgI89PUf0xjkDO9
         6qwRUQLoYtKss8WsCr4dM4mRAYxeT+qzj9ZZzG6zz1ZjyOAoK3INLYmJ/3zXRXsAcGPK
         UUBUOxj7/q1i0Ma6a4OjKZdgNGCGnSXfGZXzV0M2Hfogw/xstqoYnv+i6lk1dtonXAEO
         vKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qKjNpoh1DG7dpSG7QxsZzMQm795umqJUMUqKJW//aCo=;
        b=l8ZRbDgUeM2mp5AdTemBwV3ehpFh5P1lwJR+F2Uil2r+nz9XjKONDQK+1ba50lND81
         HLYgW52/ZW8h1WtygcNl2t7agK9CFFqMF/KcVk2kJUm4TSqt5ObK5kk+uPEyaKXOsq8u
         g1j1glLanWrc//YGfLqXs4IqID8o/qtz/uWCS17sbkA8DR5kLK9s1gd2DxrVE1af9IdR
         nhSqGjG+kmbW1IdK3sr8DLQ2Qrj7gGGb/LrJ1JQdIcTd4t21hVd1uz5fPacAd3Ugm19N
         ciDePWTwvPolRbw1wv/5IUPhno3qjGesi37gfGnZMAZBE/PAw+h8K2Au+TIizLr/QOAl
         25ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jW9tt+6e;
       spf=pass (google.com: domain of timothymack332@gmail.com designates 2a00:1450:4864:20::42c as permitted sender) smtp.mailfrom=timothymack332@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com. [2a00:1450:4864:20::42c])
        by gmr-mx.google.com with ESMTPS id z7si748197ljn.8.2022.02.10.09.55.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 09:55:54 -0800 (PST)
Received-SPF: pass (google.com: domain of timothymack332@gmail.com designates 2a00:1450:4864:20::42c as permitted sender) client-ip=2a00:1450:4864:20::42c;
Received: by mail-wr1-x42c.google.com with SMTP id o24so8319027wro.3
        for <jailhouse-dev@googlegroups.com>; Thu, 10 Feb 2022 09:55:54 -0800 (PST)
X-Received: by 2002:adf:ee46:: with SMTP id w6mr7137561wro.451.1644515754223;
 Thu, 10 Feb 2022 09:55:54 -0800 (PST)
MIME-Version: 1.0
From: Nathan Caleb <nathancalebnathan@gmail.com>
Date: Thu, 10 Feb 2022 05:55:37 -1200
Message-ID: <CAMuE1iFPywt9nNVmxnKCLTPmC+=qyhJAC7WxpQ2vbX2qZLkPoQ@mail.gmail.com>
Subject: From Karen Smith Trust
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000005baf7005d7ada93f"
X-Original-Sender: nathancalebnathan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=jW9tt+6e;       spf=pass
 (google.com: domain of timothymack332@gmail.com designates
 2a00:1450:4864:20::42c as permitted sender) smtp.mailfrom=timothymack332@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000005baf7005d7ada93f
Content-Type: text/plain; charset="UTF-8"

I wrote a previous message which was not answered, hope all is well with
you?

Sincerely yours
Nathan Caleb
For Karen Smith Trust

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMuE1iFPywt9nNVmxnKCLTPmC%2B%3DqyhJAC7WxpQ2vbX2qZLkPoQ%40mail.gmail.com.

--0000000000005baf7005d7ada93f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wrote a previous message which was not answered, hope al=
l is well with you?<br><br>Sincerely yours<br>Nathan Caleb<br>For Karen Smi=
th Trust<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAMuE1iFPywt9nNVmxnKCLTPmC%2B%3DqyhJAC7WxpQ2vbX2qZ=
LkPoQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAMuE1iFPywt9nNVmxnKCLTPmC%2B%3DqyhJAC7=
WxpQ2vbX2qZLkPoQ%40mail.gmail.com</a>.<br />

--0000000000005baf7005d7ada93f--
