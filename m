Return-Path: <jailhouse-dev+bncBAABBCO4ROAQMGQEGGUISHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3d.google.com (mail-vs1-xe3d.google.com [IPv6:2607:f8b0:4864:20::e3d])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BD5315794
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Feb 2021 21:18:18 +0100 (CET)
Received: by mail-vs1-xe3d.google.com with SMTP id u29sf3154660vsj.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Feb 2021 12:18:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612901898; cv=pass;
        d=google.com; s=arc-20160816;
        b=t7bVK8LL/j2Q6168AfXiDdm50ZAgkbQFj5IHKPrv8wLylOfbHGtiTXPjAS62icfPz7
         y6S/KU//qLq/1Uud9OmW2BezBQGi1nsGNhYeJ7fcompPcUz0m/Qb0QbisYGxvA7oBj4f
         Az8ck5hDsYbzCk04HfFN2jkBkB/naCRWHKcPvEF3gZGmN9uB6tppAu2I0LSStnm64Rk2
         PMVk/fqM30a/KtqXwnspYv6pcSqcnsoEv713TQzgEx4FsreM8sYcmpyWhlnzxonNt15D
         XwxiTzHleq74IcBPTgQ/ufnFwPUyBrcU+1prnqR2oAB3lt/0dslBk3efUZgzr7JqV7w+
         NnGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:date
         :reply-to:to:subject:from:message-id:mime-version:sender
         :dkim-signature;
        bh=g/1Vfzo4hBUaJN8wsWm6KjJQtlNxUn1Jd1z8osB2BMg=;
        b=p2tqgMdq/75jZPbMIqu+Qs9GfKdjqI28rvmqUXOsx8Po2tcs62cL7UqxobU/jAIDly
         xCUvqXBy09BPqsAB/48+s5soLXDvtCoFMfLuFZfPJoGgQ1BiZ1yhAGePkZDsZHrXqxkM
         +Pp0VPeHfCjUjEd1WHpAOmDD3CdEG8LYQzd1cYSSE69XrkOvyRhBu2DuOMhFY5IvhfDl
         WHVx5g7n96ergSsdVZqnPYlobf/76fpbIk3ZCZF6KYYKSJT5fG2Tgf6wGC3PS0XssD83
         MMPdiF3+rTkNthyLu78ahlrIumOVS6YFJxWwxvuVsQImhC3QJ7YvzEbfH96WBq2o8QkK
         /aEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@dkim.uni5.net header.s=uni51 header.b=bSZ9kIMS;
       spf=softfail (google.com: domain of transitioning naiara@sampaiocorreafc.com.br does not designate 2804:10:6074::203:116 as permitted sender) smtp.mailfrom=naiara@sampaiocorreafc.com.br
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:message-id:from:subject:to:reply-to:date
         :x-original-sender:x-original-authentication-results
         :content-transfer-encoding:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g/1Vfzo4hBUaJN8wsWm6KjJQtlNxUn1Jd1z8osB2BMg=;
        b=emLCumPvVrGhJ4VHLaWTxOHyl3Cpp4rwyucGDX3zuhkwQw6rvHGpmNxApXJVZ6FyRX
         r/bZ6NawBTFglFhB6HLXq92VJYOYILiYLy6iASv5VQT9LUCyhGfHdQ7EoqCLdGYfFMCu
         7d/3yi/JcIs1q9YDwArSbaR0iWKRlPfxEvk57OXxm2t+hofPbnUn7hhzAxHMguD8s98E
         IkFO09HecLdcocn4yRVGgP1Fio0PzhJZwqD9dkmLPAXQI6mBEpXvDvRrZTeA/yD4W8GQ
         ydEUoiA+YLlFuobHc+asMd7r2GzxemTqvGViW/3fYlFrBMcbPiRLflnHOMgWmyug7D2U
         QOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:message-id:from:subject:to
         :reply-to:date:x-original-sender:x-original-authentication-results
         :content-transfer-encoding:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g/1Vfzo4hBUaJN8wsWm6KjJQtlNxUn1Jd1z8osB2BMg=;
        b=qWKlHl3cpTayvOntO6SjS0CnarQw3NbNBlhS/g0N2z3OpxNymlag290WzEutaXUp5X
         k12kNUDHE1Qk6gt/OYVf8AuuagkZ/BqgEmwiDbkgm6dfDBZsmAXmOJpuZdHhn7gglS9z
         W8s5RahDA/0AJwbObFMdNmQlgPOvg2+rw4Y8HLQVseg7i8lOTvhvd9XhrH6S8z4zMpo/
         f5AuCuTCs/zJvWjkcsufJHn4FD++DIeRVEXxWLb/pBo+GpKuZvYtCHfLix9GFM/GT7Bl
         83gjexghBqe38ysUfvRlXn0XCL1Q+sCVaTUly20cRiJqKOFkeOMrr0dwFnq0w1e6esUN
         5Gsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533o+vjIx3/miDu1jKHyBSJ7Yn0Zs1mVqoxLrKb9JDArFY9Szx1k
	EZSq9t0hP+tZZlUAyb03lGk=
X-Google-Smtp-Source: ABdhPJwDv6x8ladLDOhvWiHEraki/mEXZYlMeIJ9oXOGzjpiVP/W2h30GkcP77b/fJdmx5he/aCvGw==
X-Received: by 2002:ab0:5963:: with SMTP id o32mr14613452uad.11.1612901897893;
        Tue, 09 Feb 2021 12:18:17 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:4507:: with SMTP id s7ls167367vka.3.gmail; Tue, 09 Feb
 2021 12:18:17 -0800 (PST)
X-Received: by 2002:a1f:bfd5:: with SMTP id p204mr8765016vkf.6.1612901897449;
        Tue, 09 Feb 2021 12:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612901897; cv=none;
        d=google.com; s=arc-20160816;
        b=NXbC11V2tS7al9d7x6dwKkk7mMd5KLWdvsyhxJzSxh4L2q84c3AWzEyftp9Pdhw8Ur
         r17/tWJcEm6ECI8qTk6I+vn0zZW1g06n/Za25HLda9uQh/1KsNfpigpRG5SE89N2nOR1
         rZcsR/deu/Yur8VoCLbMeAk62EpMD39f0V3EftrfjeYYw/7vTq0Fx1eQBJzaAzSe6cGr
         4Zgiuq5wdHTm0iXwGo4DGejOXwi7CD8my9+djIdHFvq0w+x1LGG2Rh/7xJfWimY0EdTL
         10biDNyKdXFfVNCdMo4wT1iOh7/ne/tOOI//0+fPvad3U4PYMhavJ/9BiiV7OXJJ49pb
         EWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:reply-to:to:subject:from:dkim-signature:message-id;
        bh=ra+2fV79njcGDhD0oMh39VHfZXntrM5IjZq0LM9wxFo=;
        b=iHB7mmfX2hqk3MfovMxyAWBiYSwHpI0/iJ7Sp9jNj3HVOjZH8jQ4WWBWTpk+Is0r0M
         sW4RlpaT1gZnGPbKfjjvPoUn31P9DxMgnAajKgMgg56EPbiOwPvOUF7DhBZ0/S+DsRTi
         MOSJM8Go1JbEAWDptxCwgoSYXT456xV330LyJItzOqPX+TG1hJgarKklQmwzwcnMTAcl
         /X2ImxTixTg9CS6tmQeH4WihxAy97pzIDm9g8Eyum0WndE3tZXa+WZb4Aokxtr7xZO8T
         YuDptaQvK1hOkjsSjcJbCKvStl/Q4vKioFmWgZq43WQ2AeF+T8qZmSxZ/Xadl8Z4kzGM
         HH9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@dkim.uni5.net header.s=uni51 header.b=bSZ9kIMS;
       spf=softfail (google.com: domain of transitioning naiara@sampaiocorreafc.com.br does not designate 2804:10:6074::203:116 as permitted sender) smtp.mailfrom=naiara@sampaiocorreafc.com.br
Received: from smtp-sp203-116.hospedagem.net (smtp-sp203-116.hospedagem.net. [2804:10:6074::203:116])
        by gmr-mx.google.com with ESMTPS id q1si1372626vsn.1.2021.02.09.12.18.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 12:18:17 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning naiara@sampaiocorreafc.com.br does not designate 2804:10:6074::203:116 as permitted sender) client-ip=2804:10:6074::203:116;
Message-ID: <6022ee09.1c69fb81.64a30.3affSMTPIN_ADDED_MISSING@gmr-mx.google.com>
Received: from DESKTOP-PP3A8MN (170-80-135-106.iubtelecom.net.br [170.80.135.106])
	(Authenticated sender: naiara@sampaiocorreafc.com.br)
	by smtp-sp203-116.hospedagem.net (Postfix) with ESMTPA id 1E3EC2009463
	for <jailhouse-dev@googlegroups.com>; Tue,  9 Feb 2021 17:18:15 -0300 (-03)
From: "Naiara Araujo" <naiara@sampaiocorreafc.com.br>
Subject: Nota gerada n. 30600566296759
To: jailhouse-dev@googlegroups.com
Content-Type: text/html; charset="UTF-8"
Reply-To: naiara@sampaiocorreafc.com.br
Date: Tue, 9 Feb 2021 17:18:14 -0300
X-SND-ID: 94qlC/3BkHTH3c88MHrfKKi+WYlF1NlXu9ttUHUteUDsZa8RbsjKt5RML42c
	u+DRFyONa2btvC4tjxSpfBq1Vkdu3Q+9+1OsLfSYXOFdvGvC4uAHnYFng+JR
	XOyrTJmTtvVlLSwtIrahza12Kk/lLtJllLYm83W14xbtPwManJmTKQcNnzUU
	gbw18VjBVX6AurI3H/3WXicpTvzRY81sCVqXbOrMx4hrcAAjAy0YK4z/33WF
	jvhkOZYJIQAbBo4w39AGLNYVAAkU/FmlYrlG2GqLDc6bmZ6Zsy39noDszoV7
	7gNrh18c4jMCGuckjq7JVliXHybKnUpkFf+AWrV29mVi82I/TFs3yNSvC9+z
	U6sGV7OxWppwoEnnoOs4T//jhVyNUR6s6FmFVn+TDFoWEzmzs2nIM46YLfO3
	dyl1S7Siz89PEumnkkC5bWLWRIyX51RifFbKqmv/kP20a3XTAE7tg2Wsmj0w
	16RZ2+nLnkmk9WeLl9XBoMpQsVelDPUj/pMe5OCWWGQEtgS+DnvrfOs1eS0u
	RtIAig7voP9y3p4=
X-Original-Sender: naiara@sampaiocorreafc.com.br
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@dkim.uni5.net header.s=uni51 header.b=bSZ9kIMS;       spf=softfail
 (google.com: domain of transitioning naiara@sampaiocorreafc.com.br does not
 designate 2804:10:6074::203:116 as permitted sender) smtp.mailfrom=naiara@sampaiocorreafc.com.br
Content-Transfer-Encoding: quoted-printable
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

<p>&nbsp;</p>
<p><a title=3D"0030600003060566296759" href=3D"https://is.gd/ArqFJL?0030600=
003060566296759" target=3D"_blank" rel=3D"noopener">https://www.nfe.fazenda=
.gov.br/portal/nfe?Consulta=3D0030600003060566296759</a></p>
<p>&nbsp;</p>
<p>NF eletronica emitida de servi&ccedil;os prestados</p>
<p>&nbsp;</p>
<p>N&uacute;mero da NF : 3060000566296759<br />CCM : 0287<br />Chave de ace=
sso : 0000000000000030600003060566296759</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6022ee09.1c69fb81.64a30.3affSMTPIN_ADDED_MISSING%4=
0gmr-mx.google.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/6022ee09.1c69fb81.64a30.3affSMTPIN_ADDED_MI=
SSING%40gmr-mx.google.com</a>.<br />
