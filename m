Return-Path: <jailhouse-dev+bncBDPINV4F24ORBJPSZL3QKGQEZHNY7CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42F206A14
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jun 2020 04:23:34 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id i10sf1598738wrn.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jun 2020 19:23:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592965414; cv=pass;
        d=google.com; s=arc-20160816;
        b=HerRghPehWZfCypVv5sfH2b5lqxov67WF5H9jfEStKePEeE/e5yG9clTfAsBtD614L
         aaPvu0fDFenTZhQddGlYR23Zs2gOGMI7ijB2zC+ewYRRafL92kpQXWrMHx43aQ/w+uyc
         7WV7pzlXYPtccdkcDWX/u3rT0DowakLrOPySaQu3NbbE4cZQHqt7plCtgvVgMwF5RxRs
         0rV1tY//YGGdpIXAMi5ei7BYXyofXQq0HDRp6xdu+LTGTjVr0qfkkSWtF4Z8QBOOzHtj
         J8eD1fx7U7Xrd4rwQ47BDnVUMpwXLYaFUxvrpwYBUBnkMwIfXVW9THmDSJckquiOa4pr
         E9uQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:reply-to
         :mime-version:to:subject:from:sender:dkim-signature;
        bh=mPtDTKQql59geUthrHdMoX9XxB3OdjyA2+ZnG/8ALFw=;
        b=yZ0s0R2OWuKNFdtEgse9gZ5lhR+GrLEPoSz34ydSDDFSeRjY6fXU7PdW2a0nBS6Piz
         dGu27qLjfILIa+wNK7IOVyccF/V7Cdw60RcBvR7VoYOT9t22vacxQ0mm6ZuFAVMbd6Gx
         +Uqe7qS2adpBN5Dvl0NcCsMA+yBgdgJZnjl/g8U+TljkbqIpppN6NDqdjltCt7TcnzS/
         DhJkaLcFvb7hQ5mpIpBOZNa6ey6nnewj4HmHLFxQ8RzMNM5wiRSZjaIhyNVhAPFP8zM8
         nT/YKncSNE+Rw4pktQuegmOonm0gxy4zFNqFXI6rsOlPARwDoG+GafhuHQh36zuSLam6
         vpCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=softfail (google.com: domain of transitioning karen@pei.com does not designate 80.12.242.135 as permitted sender) smtp.mailfrom=karen@pei.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=pei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:mime-version:reply-to:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mPtDTKQql59geUthrHdMoX9XxB3OdjyA2+ZnG/8ALFw=;
        b=lbqJytaTtzvNNtHKXSEONNNcB8kgCCpAJKi6Iu5PlOBzxSCsP65iPkr2YfGkW8YWCH
         se8uEp5NX06eGGgTpslacF2+m0m9M5ShcrKMk9kGYPjDiAUA3KUZr4IFpFaLMj5BjBjo
         DCS8gUG/PsY4rokIUF9vNgLt7tvsvTRQ+SvfmvhTa2JNVPoqsAENaB+7AxP0on9h7p5E
         I3YE8+5MV+5hmOLag+PomYAzcoMB+EBUar7neIHpmS13yLj3lbk87Ccxn0ftbrPzeVbA
         7Ze2Q+FIaEQQnjw7YXXmgfTye1rL/6Jnh+qWnXlT6+DDXcwNqr2LcobXlU3vh5uL6pTg
         bjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:mime-version:reply-to
         :date:message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mPtDTKQql59geUthrHdMoX9XxB3OdjyA2+ZnG/8ALFw=;
        b=ufVLOIMj7pPBEKh/QTGvlMPZFyJFU/7n44kKC0u3huJ0Usu0LuSS4YhaTDnjJM3vRX
         JmC8TZ762sNNyLtYVrG1crXQZ+vIHc65yHMgp4j54ktTha7e7p8VdlTKMwRmscOzoICZ
         B74v+lynwahxGHEq3SBZtvRigyh2rb4K+zse0/tBZYQSBv4+A0pBGUScOG01cx/vg8rl
         NXQh/1tu9q0emeqwS4Nh62HCSzdI5Rl11Ddc5gQsddprQcPWC9cBVL8HINJsmvVvhKQJ
         4CPWDse1FeSoJYE2RJUvenFCzaIOaDjwxgXlLA3Tlwk7SfrzfcOvIrqYYxk1HH/ttkZa
         egzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531p6QIXQ5biXWy/9EWO1XCc3mjbmkGittL1qq/dhnSbPaB8qnS0
	fqTx1x1LDtci2/Tp8f106KI=
X-Google-Smtp-Source: ABdhPJwtWb17UoHUVh8mR8P0SUsLxXWao/miTqNSBjFrqwHYpqQoTPdvHYlIbnM+fR1eqWRrH2zF7w==
X-Received: by 2002:adf:828b:: with SMTP id 11mr30362036wrc.58.1592965414333;
        Tue, 23 Jun 2020 19:23:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls319764wml.2.gmail; Tue, 23 Jun
 2020 19:23:33 -0700 (PDT)
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr27977408wmk.149.1592965413538;
        Tue, 23 Jun 2020 19:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592965413; cv=none;
        d=google.com; s=arc-20160816;
        b=S9Jeup2B6i/zWHzPU0DFlUhGyJfaoyDR6xRagQx6bF5boqDQstncKTHpI16h4vIZRw
         wSmKLlpq1XPSV/iHnT3EyTev870W8J2rX/hnL/p625/3hb5DuBNq45zTALsycutTBv+9
         aFbYNgim+cYFLn3ghdqcZyftfTPOl1IkmJl0LSMw3wIDGG0+j9bW+0qVgep+EtLHpUvt
         dseBtkfFPfsq9/OfFK/jaUJ8NdbM9+y7WcXNa64dQ1KQy7jcXRUHuDxGvDx0t4SjLLTv
         1eD36yLTx5p0I1ht7tEQSetCk+xEk6IPPaTROVwz0fZdwgvK1eGZjCA0EqzOaCHGaIV2
         xncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:reply-to:mime-version:to:subject:from;
        bh=AFPoJNzUDrWJZYr0IOlRHp+DWj3yKKmKwR6LxOAD6U0=;
        b=umh8UApaCq6Uqw2lq3fv4p0+pA+M2vkUOQgGp4JjGDuxU0hygYnzLKFN+O0Ei3d+oJ
         oXRccAREKo/bUbeYoLo3H49aAy9zyOV83hhfESN5We3acPZQWU7H6nQZ9/hDtjPXi1c0
         Xtt/FpmYGiS5hj/NaybjaG9q6mP+v6UkgS8D3QC/ScU4qIFwKggLgyGhVsYiw+NM+Az2
         T+BdsyMXqLiA22sqaH8mGFRjtt6VIc/RXpxwKhC+F3rb/+y1X3FEXRVnSyZuAa2BLXHf
         CUc8MO+szxbuVAeYMg3ABssflNNOXVLzYSvQgrkqS+hn/btM9o9VZZ7L+6c0uMS++3bm
         HQtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=softfail (google.com: domain of transitioning karen@pei.com does not designate 80.12.242.135 as permitted sender) smtp.mailfrom=karen@pei.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=pei.com
Received: from smtp.smtpout.orange.fr (smtp13.smtpout.orange.fr. [80.12.242.135])
        by gmr-mx.google.com with ESMTPS id h21si261840wmb.0.2020.06.23.19.23.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jun 2020 19:23:33 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning karen@pei.com does not designate 80.12.242.135 as permitted sender) client-ip=80.12.242.135;
Received: from DESKTOP-Q5JCF6G ([90.3.146.230])
	by mwinf5d71 with ME
	id uqBE220044yUvma03qPXfh; Wed, 24 Jun 2020 04:23:33 +0200
X-ME-Helo: DESKTOP-Q5JCF6G
X-ME-Date: Wed, 24 Jun 2020 04:23:33 +0200
X-ME-IP: 90.3.146.230
From: "Ms Karen Ngui" <karen@pei.com>
Subject: To ~~~ jailhouse-dev@googlegroups.com
To: <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="D712aoV3QpKmaCsvfYI=_ZXgktejymc9FD"
MIME-Version: 1.0
Reply-To: <invoicekngui054@gmail.com>
Date: Tue, 23 Jun 2020 19:23:32 -0700
Message-Id: <23312020062319E3B1A5D2AE$AA3A81239A@DESKTOPQJCFG>
X-Original-Sender: karen@pei.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=softfail
 (google.com: domain of transitioning karen@pei.com does not designate
 80.12.242.135 as permitted sender) smtp.mailfrom=karen@pei.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=pei.com
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

This is a multi-part message in MIME format

--D712aoV3QpKmaCsvfYI=_ZXgktejymc9FD
Content-Type: text/plain; charset="UTF-8"


Kindly confirm if you got my business collaboration In-mail sent to you via LinkedIn.

Thanks. Mrs. Ngui

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23312020062319E3B1A5D2AE%24AA3A81239A%40DESKTOPQJCFG.

--D712aoV3QpKmaCsvfYI=_ZXgktejymc9FD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
  <META name=3DGenerator content=3D10.90> <META name=3Dviewport content=3D"=
width=3Ddevice-width, initial-scale=3D1"> <META name=3Dformat-detection con=
tent=3Dtelephone=3Dno><title>To ~~~ jailhouse-dev@googlegroups.com</title>
 </head>
 <body style=3D"BACKGROUND-COLOR: #ffffff" bgColor=3D#ffffff> <P align=3Dce=
nter><FONT size=3D3 face=3DArial><STRONG><FONT size=3D3 face=3DArial><STRON=
G>Kindly check through email,&nbsp; I sent you a proposal via LinkedIn on t=
he 20th of last month...did you get the message?</STRONG></FONT></P></STRON=
G></FONT> <P align=3Dleft><FONT size=3D3 face=3DArial></FONT>&nbsp;</P></bo=
dy>
 </html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/23312020062319E3B1A5D2AE%24AA3A81239A%40DESKTOPQJC=
FG?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgi=
d/jailhouse-dev/23312020062319E3B1A5D2AE%24AA3A81239A%40DESKTOPQJCFG</a>.<b=
r />

--D712aoV3QpKmaCsvfYI=_ZXgktejymc9FD--

