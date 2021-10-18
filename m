Return-Path: <jailhouse-dev+bncBCG5DCMI4YHRBPMBW6FQMGQEFMIBFZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC84326CC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 20:45:19 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id u5-20020a63d3450000b029023a5f6e6f9bsf10302887pgi.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 11:45:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634582717; cv=pass;
        d=google.com; s=arc-20160816;
        b=UxBZlT6dFj3quMPVoZsLrcEpmja4JdWTPJXIwBf1MufCb1tdaG/DQqyWYvKV7Ny8yo
         nZQGp1mXNBo1FYM543j8+z27OWFW18Q8RBwh+/F1kaFJCV4+4PdIxzEwkPIA8kc6o7Nq
         7PCCumazdQnQ6IXlJnHO+28uSM4YyXWjR9JC7WVFlc16lwtMkFF8wmLlmSry9VKzuf76
         RkwlpCtJTmQAigOAUU5xYW5ePq7u6GPq40hCdGMuiufq7RExm/PQLf+S0nUz9BH3+dQI
         dUtduZ2NJ8/Brgk+Gu2BqfooE5wjfZCnZLvgtJxgCUYkOS+bF80GXyHHPuh6Dh+yOvYe
         vIeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=nm4IPvkBG2CoQn1nBb7cza4aMD8J0nJpi4jZU6KAnlc=;
        b=MfrRB7XGK1G6/EnRBOKNfAO9hq4sscIBVOhonG03ErpLMwPZAJl6UHpv7CwLyI7mtI
         FAX0k3fEUfoBdA+OOVySIA6HPMwqgR8EQCddaRlRAxaHhc3OIdjW2JRf/E0EFxPhv/Hv
         JXOM3xAfOSVS/Vu3Eg/O5gnuNbtkcg7vqZJLMz9tcS7XuTfXSgJXcU+tLbxlB3q/0Ilm
         f8GHGhjDGxIH4AatWUnLjNoauECuCvsCkuvnrhjZ9/p7LPgMpMh8KsA7M5cQidlOeiwl
         8/D5gSS4of+kyTtGRRJ3e/Goqbv+5fzI+3oM+iZpPhtLQnHdaOvnIcaI8dYENl7emLNX
         6cYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SuvcEloA;
       spf=pass (google.com: domain of khalifasy83@gmail.com designates 2607:f8b0:4864:20::d36 as permitted sender) smtp.mailfrom=khalifasy83@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nm4IPvkBG2CoQn1nBb7cza4aMD8J0nJpi4jZU6KAnlc=;
        b=X8EuSM235YB9I77zuDgZ0gnNqUa/cjHVcUhoYVgjQ0T6wgNGXyQkkWPtOceyLtKWbo
         Ix8zsnFq/ffdnruglE8jvtolBNf1jwmnJ168kaB/Rlu7kJHVmqWxSl04ltZLbiF7hzfV
         4lDgb2CZFK+PJZTTXcqnC4IXYSgm/Xul3+keScNxVHw2mQ4f4HgQqUkUiUH2fMHHwWum
         WnGsFe3PaWLd5IMoxJdhwnuGOQyy4mHDv3EeuIBGWsoA1eaRycVq9Guw2Sdo3as4pxIs
         deAdM5P88U81NWqpOaxmZQESWA8TJxVgg9BzXDHwxr+HpYHYiXtUbN5F7NZfeEYlroL0
         t6Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nm4IPvkBG2CoQn1nBb7cza4aMD8J0nJpi4jZU6KAnlc=;
        b=l6/282jo0Prj+lnORFsKdVIiMpudiSsLh/D2S4PMIIrlB7/Nu2HZLJ8BEnISeu9+eb
         mC5s8K0V9UF7l5eQw2XSqeAKbLDhx/8hgHE4t/D4loGzXyYcYiQjIXEmSPvUxhwRijcZ
         8E8DuX3V0eIwxB21W38EpZdsOjDAQUekhPEA5Ws8YWpMvlDTE94RtrFwihpi+0CGQ3l5
         T3x5azQp3P49Ertp2PQUL5G+lRLkj35xNGHFKwX/txiXnD6ufxi1UgHNxNfP2JFH/AJf
         0+fY0+IIRofFnRKjBc5BC5V3s4lx40JSZ0Hj+kHl8TVY5vsn4kJYVlVc9/4ga2VEYBIR
         xUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nm4IPvkBG2CoQn1nBb7cza4aMD8J0nJpi4jZU6KAnlc=;
        b=k1tyO9vbFrL4bbB4ZgOHom2UmU8QAk1I4O5SEVooyHs6Zwb90XH5IUv9QlN2uBuhGE
         f6/dBkJoCHPFzYbX+IuRakcMBhysuCCWjL+UAf8GCI7cKfzXLAasPakUxaaj3hX78XPf
         hrSgguW/znSI1FHEKYqRRTyJFKpRE4E4CdNn/+75q0B3UNDpZPO1Arld191eJzsfPA7Q
         hEi0aROML9zz0h5zWxOoVAHjD32GZWFdA6ZaeP+tUaKHw3sfLrIy3oXU83GzZybsSyIu
         +furr4fbwB9b03TQLiOPLDElzquhe36XOQuQG+kDFeHcBJZW/OM0tbFPIhai5WN6hwdJ
         jZ8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532AT1u867MVvbqRuZh7U+cYzkWABB2UFR9yHltY8fCTte0pMFPQ
	kTKhGsP4Tbhc139pfNi6zrs=
X-Google-Smtp-Source: ABdhPJz2WeGHGHxtjJ7wRY3NcCSQb00iFaYNqOYjBb8w9N75IiZ9pVqAIdSG0VI2+rX6ADvR0HOGsA==
X-Received: by 2002:a17:902:c20c:b0:13a:3f4a:db58 with SMTP id 12-20020a170902c20c00b0013a3f4adb58mr28430863pll.12.1634582717518;
        Mon, 18 Oct 2021 11:45:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:dad1:: with SMTP id q17ls9414755plx.4.gmail; Mon, 18
 Oct 2021 11:45:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8b:: with SMTP id om11mr702781pjb.216.1634582716507;
        Mon, 18 Oct 2021 11:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634582716; cv=none;
        d=google.com; s=arc-20160816;
        b=yQY40I33yW0RsEl9XZE8Rheq3hiyucvPsbg9YIxn2cwcMIyV40fjsltKK6DMzkqVC5
         PlEDp8MOz4g0YcU46FRZHM84YR5XcWZbvEIVM/bczHCQ2mOvq5OIZdmSfoa1/CMJARyc
         OpOkW9mgFzwGcwwhNP1Uws07fRGCbIEh/iv3U6Wfnwv7ZUa4eGBdWsSJnHqnl2q/0+e7
         zMqk/s/txP5sQQ7sB85g34vYIcINF6wCjQQYujqCz3v48m83mMFQV49QlL4f+Hd9yjYZ
         5DkwnRjrFlmtctBGeq7BGeY7kLgPwJoz91N6CbaTeN6HrJlgoNd9IxNL1ReyKzmAk1QK
         7ZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JCf4Bk5E9vdvw80JLB032DxouOfcZx/XeZ4124xSw54=;
        b=xhZpI9tchXHokKQqaecylnF8L9YAODogMEicNmWewcXknslPQV41G62vKKeAN6ONi+
         zwIieogZwJhZtvGVlfnhJwpnJcvU2yCkauTI2t1maZi4/nSjFRStYmih+USviWUEPSZ1
         zGMSI951XkAEiuksCLAWJd93WA6HcFd6G9xAoefNhIJ5cEhU1e3tbgIFuTIwCkDwqCOQ
         TpBnBxJd3Jtnqc8HOIP0E/4YltT9RGKkGWzqcB37CebWPL7Xy5A8xiCWZ4CYQWXL8JUo
         DWRJ5TOcnHXy6G4R+nt50LqLzHH0Cmta9IB8MfVPdDFgtD67iPL54QegoyZpnEjcXjN9
         ac2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SuvcEloA;
       spf=pass (google.com: domain of khalifasy83@gmail.com designates 2607:f8b0:4864:20::d36 as permitted sender) smtp.mailfrom=khalifasy83@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com. [2607:f8b0:4864:20::d36])
        by gmr-mx.google.com with ESMTPS id f11si362335plb.5.2021.10.18.11.45.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 11:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of khalifasy83@gmail.com designates 2607:f8b0:4864:20::d36 as permitted sender) client-ip=2607:f8b0:4864:20::d36;
Received: by mail-io1-xd36.google.com with SMTP id x1so17437687iof.7
        for <jailhouse-dev@googlegroups.com>; Mon, 18 Oct 2021 11:45:16 -0700 (PDT)
X-Received: by 2002:a6b:6d06:: with SMTP id a6mr16038161iod.25.1634582716295;
 Mon, 18 Oct 2021 11:45:16 -0700 (PDT)
MIME-Version: 1.0
From: Solange Atatar <solange.r.atatar@gmail.com>
Date: Mon, 18 Oct 2021 19:45:02 +0100
Message-ID: <CAGEDBYKzeY+0RRu9MEPKT2DoYfm1v+cyA+w9k09WX07e5BouRw@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000292f9105cea4f2e9"
X-Original-Sender: solange.r.atatar@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=SuvcEloA;       spf=pass
 (google.com: domain of khalifasy83@gmail.com designates 2607:f8b0:4864:20::d36
 as permitted sender) smtp.mailfrom=khalifasy83@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000292f9105cea4f2e9
Content-Type: text/plain; charset="UTF-8"

Can I share something with you ?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGEDBYKzeY%2B0RRu9MEPKT2DoYfm1v%2BcyA%2Bw9k09WX07e5BouRw%40mail.gmail.com.

--000000000000292f9105cea4f2e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can I share something with you ?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGEDBYKzeY%2B0RRu9MEPKT2DoYfm1v%2BcyA%2Bw9k09WX07=
e5BouRw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAGEDBYKzeY%2B0RRu9MEPKT2DoYfm1v%2Bcy=
A%2Bw9k09WX07e5BouRw%40mail.gmail.com</a>.<br />

--000000000000292f9105cea4f2e9--
